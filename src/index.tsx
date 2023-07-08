import { Linking, NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package '@capitual/react-native-store-review' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

const RNStoreReview = NativeModules.ReactNativeStoreReview
  ? NativeModules.ReactNativeStoreReview
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function openNativeReview(): void {
  RNStoreReview.requestReview();
}

export function openCustomReview(appleId: string, googleId: string): void {
  const isAndroid = Platform.OS === 'android';
  if (isAndroid) {
    Linking.openURL(`market://details?id=${googleId}`);
  } else {
    Linking.openURL(
      `https://itunes.apple.com/us/app/appName/${appleId}?mt=8&action=write-review`
    );
  }
}
