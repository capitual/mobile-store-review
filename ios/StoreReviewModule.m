//
//  StoreReviewModule.m
//  ReactNativeStoreReview
//
//  Created by Nayara Dias Gonçalves on 06/07/23.
//

#import <Foundation/Foundation.h>
#import <StoreKit/SKStoreReviewController.h>
#import <UIKit/UIKit.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(StoreReviewModule, NSObject)

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}

RCT_EXTERN_METHOD(requestReview)

+ (BOOL)requiresMainQueueSetup
{
  return YES;
}

@end
