//
//  AdHub.swift
//  Iffirmations
//
//  Created by Fares Cherni on 01/03/2023.
//

import GoogleMobileAds

class AdHub : NSObject , GADFullScreenContentDelegate {
    enum CallSources {
        case category , theme
    }
    static var ad : GADRewardedInterstitialAd?
    var inProgress :  Bool = false
    var callSource :  CallSources = .category
    static var shared = AdHub()
    var adCondition : Bool {
        if callSource == .category {
          return SharedCouter.shared.categoryAdCounter != 0  &&  SharedAdTimer.shared.isAbleToPresentAds &&  AdHub.ad == nil  && !inProgress
        }
        else {
            return SharedCouter.shared.ThemeAddCounter != 0  &&  SharedAdTimer.shared.isAbleToPresentAds &&  AdHub.ad == nil  && !inProgress
        }
    }
    var handler : (()->()) = {}
    var dismissHandler : (()->()) = {}
    func requestAd(handler :@escaping ()->(),dismissHandler :@escaping ()->() = {})  {
        if adCondition  {
            inProgress = true
            let request = GADRequest()
            let adId = "ca-app-pub-3940256099942544/6978759866" // Todo: // must be replaced with real adId
            GADRewardedInterstitialAd.load(withAdUnitID: adId, request: request) {[weak self] ad, error in
                if let error = error {
                    print("error \(error)")
                    SharedAdTimer.shared.addDelay()
                    handler()
                    return
                }
                guard let root = UIApplication.shared.keyWindowPresentedController else {
                    self?.handler()
                    return
                }
                self?.handler = handler
                self?.dismissHandler = dismissHandler
                AdHub.ad = ad
                AdHub.ad?.fullScreenContentDelegate = self
                AdHub.ad?.present(fromRootViewController: root, userDidEarnRewardHandler: {
                handler()
                })
            }
        }
        else {
            SharedAdTimer.shared.addDelay()
            handler()
        }
        
    }
    
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        AdHub.ad = nil
        inProgress = false
        handler()

    }
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        dismissHandler()
        if callSource == .category {
            SharedCouter.shared.categoryAdCounter -= 1
        }
        else {
            SharedCouter.shared.ThemeAddCounter -= 1
        }
        
        SharedAdTimer.shared.addDelay()
        AdHub.ad = nil
        inProgress = false
    }
    

}
