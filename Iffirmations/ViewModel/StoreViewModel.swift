//
//  StoreViewModel.swift
//  Iffirmations
//
//  Created by Fares Cherni on 23/02/2023.
//

import Foundation
import RevenueCat
import SwiftUI
import os.log


/*
 Configuration file for your app's RevenueCat settings.
 */

struct Constants {
    
    /*
     The API key for your app from the RevenueCat dashboard: https://app.revenuecat.com
     */
  //  #error("Modify this property to reflect your app's API key, then comment this line out.")
    static let apiKey = "appl_JtbkMsmaTucZlysUQcQxTDWjOme"
    
    /*
     The entitlement ID from the RevenueCat dashboard that is activated upon successful in-app purchase for the duration of the purchase.
     */
//    #error("Modify this property to reflect your app's entitlement identifier, then comment this line out.")
    static let entitlementID = "premium"
    
    static let annualProductID = "com.oz.Quottie.premium"
    
}




class PurchasesDelegateHandler: NSObject, ObservableObject {

    static let shared = PurchasesDelegateHandler()

}

extension PurchasesDelegateHandler: PurchasesDelegate {
    
    /**
     Whenever the `shared` instance of Purchases updates the CustomerInfo cache, this method will be called.
    
     - Note: CustomerInfo is not pushed to each Purchases client, it has to be fetched.
     This delegate method is only called when the SDK updates its cache after an app launch, purchase, restore, or fetch.
     You still need to call `Purchases.shared.customerInfo` to fetch CustomerInfo regularly.
     */
    func purchases(_ purchases: Purchases, receivedUpdated customerInfo: CustomerInfo) {
        
        /// - Update our published customerInfo object
        StoreViewModel.shared.customerInfo = customerInfo
    }

    /**
     - Note: this can be tested by opening a link like:
     itms-services://?action=purchaseIntent&bundleId=<BUNDLE_ID>&productIdentifier=<SKPRODUCT_ID>
     */
    func purchases(_ purchases: Purchases,
                   readyForPromotedProduct product: StoreProduct,
                   purchase startPurchase: @escaping StartPurchaseBlock) {
        
        
        
        startPurchase { (transaction, info, error, cancelled) in
            if let info = info, error == nil, !cancelled {
                StoreViewModel.shared.customerInfo = info
            }
        }
    }

}



class StoreViewModel: ObservableObject {
    
    static let shared = StoreViewModel()
    let logger = Logger(subsystem: "com.Scanzi.logger.shared", category: "UserViewModel")
    /* The latest CustomerInfo from RevenueCat. Updated by PurchasesDelegate whenever the Purchases SDK updates the cache */
    @Published var customerInfo: CustomerInfo? {
        didSet {
            withAnimation {
                subscriptionActive = customerInfo?.entitlements[Constants.entitlementID]?.isActive == true
            }
            
        }
    }
    
    
    /* The latest offerings - fetched from MagicWeatherApp.swift on app launch */
    @Published var offerings: Offerings? = nil
    
    /* Set from the didSet method of customerInfo above, based on the entitlement set in Constants.swift */
    @Published var subscriptionActive: Bool = false
    
    @Published var showPaymentView : Bool = false
    
    public func refreshSubscription() {
        Purchases.shared.getCustomerInfo {[weak self] (info, _) in
            withAnimation {
                self?.customerInfo  = info
            }
           }
       }
    


}


struct ErrorConstants {
    let tittle: String
    let description: String
}

class PaymentErrorHandler: ObservableObject {
    @Published var restoreFailedAlert : Bool = false
    @Published var restoreSuccessfulAlert : Bool = false
    @Published var restoreSuccessfulAlertNoSubscription : Bool = false
    @Published var purchaseFailedAlert : Bool = false
    @Published var purchaseSuccessfulAlert : Bool = false
    static let purchaseFailed = ErrorConstants(tittle: "Purchase failed", description: "Something went wrong. Please try again!")
    static let purchaseSuccessful = ErrorConstants(tittle: "You're all set", description: "Your purchase was successful.")
    
    static let restoreFailed = ErrorConstants(tittle: "Purchase Error!", description: "Please check your network connection and try again")
    static  let restoreSuccessful = ErrorConstants(tittle: "Success", description: "Your subscription was restored.")
    static   let restoreSuccessfulNoSubscription = ErrorConstants(tittle: "Restore error", description: "No active subscription found.")
    
    
}
