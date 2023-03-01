//
//  IffirmationsApp.swift
//  Iffirmations
//
//  Created by Fares Cherni on 20/02/2023.
//

import SwiftUI
import RevenueCat
import GoogleMobileAds

@main
struct IffirmationsApp: App {
    @StateObject var paymentVM = StoreViewModel.shared
    @StateObject var wQuoteVM : WQuoteViewModel =  WQuoteViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView(wQuoteVM: wQuoteVM)
                .onAppear {
                    firstCall()
                }
        }
    }
    
    func firstCall() {
        Task {
            do {
                paymentVM.offerings = try await Purchases.shared.offerings()
                paymentVM.refreshSubscription()
            } catch{
            }
        }
    }
}



class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      //initialise revenueCat
      Purchases.logLevel = .error
      Purchases.configure(withAPIKey: Constants.apiKey)
      Purchases.shared.delegate = PurchasesDelegateHandler.shared
      //initialise admob
      GADMobileAds.sharedInstance().start(completionHandler: nil)
      GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = [ "22025892c524aac5dab3377cc9efde0e" ]

    return true
  }

}
