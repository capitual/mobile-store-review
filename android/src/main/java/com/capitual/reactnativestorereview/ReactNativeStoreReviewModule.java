package com.capitual.reactnativestorereview;

import androidx.annotation.NonNull;
import android.util.Log;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.module.annotations.ReactModule;

import com.google.android.gms.tasks.Task;
import com.google.android.play.core.review.ReviewManager;
import com.google.android.play.core.review.ReviewManagerFactory;
import com.google.android.play.core.review.ReviewInfo;

@ReactModule(name = ReactNativeStoreReviewModule.NAME)
public class ReactNativeStoreReviewModule extends ReactContextBaseJavaModule {
  public static final String NAME = "ReactNativeStoreReview";

  public ReactNativeStoreReviewModule(ReactApplicationContext reactContext) {
    super(reactContext);
  }

  @Override
  @NonNull
  public String getName() {
    return NAME;
  }

  @ReactMethod
  public void requestReview() {
    ReviewManager manager = ReviewManagerFactory.create(getReactApplicationContext());
    Task<ReviewInfo> request = manager.requestReviewFlow();
    request.addOnCompleteListener(task -> {
      // Log.e("isSuccessful", task.isSuccessful() + "");
        if (task.isSuccessful()) {
          ReviewInfo reviewInfo = task.getResult();
          // Log.e("requestReview",  reviewInfo.toString());
          Task<Void> flow = manager.launchReviewFlow(getCurrentActivity(), reviewInfo);
          flow.addOnCompleteListener(flowTask -> {
            // Avaliação enviada com sucesso
            //Log.e("requestReview",  "sucesso");
          });
        } else {
            // Não foi possível solicitar a avaliação
          //Log.e("requestReview",  "error");
        }
    });
  }
}
