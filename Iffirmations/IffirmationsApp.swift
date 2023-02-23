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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
