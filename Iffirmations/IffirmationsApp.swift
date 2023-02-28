//
//  IffirmationsApp.swift
//  Iffirmations
//
//  Created by Fares Cherni on 20/02/2023.
//

import SwiftUI
import RevenueCat

@main
struct IffirmationsApp: App {
    init() {
        Purchases.logLevel = .error
        Purchases.configure(withAPIKey: Constants.apiKey)
        Purchases.shared.delegate = PurchasesDelegateHandler.shared
    }
    @StateObject var paymentVM = StoreViewModel.shared
    @StateObject var wQuoteVM : WQuoteViewModel =  WQuoteViewModel()
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
