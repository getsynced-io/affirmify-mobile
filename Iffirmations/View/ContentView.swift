//
//  ContentView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 20/02/2023.
//

import SwiftUI


enum OnboardingState: String, Codable, CaseIterable {
    case demo ,  configuration , main
    
}


struct ContentView: View {
    @AppStorage("AppState") var state  : OnboardingState = .demo
    @StateObject var userConfigVM : UserConfigurationVM = UserConfigurationVM()
    @StateObject var paymentVM : StoreViewModel = StoreViewModel.shared
    var body: some View {
        Group{
            switch state {
            case .demo:
                DemoView()
            case .configuration:
                NotificationTimeView(userConfigVM: userConfigVM)
                
            case .main :
                Text("Hello")
            }
        }
        .fullScreenCover(isPresented: $paymentVM.showPaymentView, content: {
            PaymentView(isPresented: $paymentVM.showPaymentView)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                        withAnimation {
                            state = .main
                        }
                    }
                }
        })
    }
}
