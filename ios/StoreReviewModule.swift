//
//  StoreReviewModule.swift
//  ReactNativeStoreReview
//
//  Created by Nayara Dias Gonçalves on 06/07/23.
//

import Foundation
import UIKit
import StoreKit

@objc(StoreReviewModule)
class StoreReviewModule: NSObject {

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
