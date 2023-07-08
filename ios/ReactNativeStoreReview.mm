#import <React/RCTBridgeModule.h>
#import <Foundation/Foundation.h>
#import <StoreKit/SKStoreReviewController.h>
#import <UIKit/UIKit.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ReactNativeStoreReview, NSObject)

RCT_EXTERN_METHOD(requestReview)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
