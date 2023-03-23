//
//  ContentView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 20/02/2023.
//

import SwiftUI


enum OnboardingState: String, Codable, CaseIterable {
    case demo  , main
    
}


struct ContentView: View {
    @AppStorage("AppState",store: store) var state  : OnboardingState = .demo
    @StateObject var paymentVM : StoreViewModel = StoreViewModel.shared
    @ObservedObject var wQuoteVM : WQuoteViewModel
    var body: some View {

          Group{
              switch state {
              case .demo:
                  DemoView()
                  
              case .main :
                  GeometryReader { geometry in
                      HomeView(wQuoteVM: wQuoteVM)
                          .environment(\.mainWindowSize, geometry.size)
                  }
              }
          }
    
      .navigationViewStyle(.stack)
      
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
