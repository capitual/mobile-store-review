import Foundation
import UIKit
import StoreKit

@objc(ReactNativeStoreReview)
class ReactNativeStoreReview: NSObject {

  @objc
  func requestReview () -> Void {

    if #available(iOS 10.3, *) {
        SKStoreReviewController.requestReview()
    } 
  }

  @objc
  func constantsToExport() -> [String: Any]! {
    return ["isAvailable":  (NSClassFromString("SKStoreReviewController") != nil)  ? (true) : (false)]
  }
}
