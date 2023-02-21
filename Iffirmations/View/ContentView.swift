//
//  ContentView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 20/02/2023.
//

import SwiftUI


enum OnboardingState {
    case demo ,  configuration , payment
    
}


struct ContentView: View {
    @State var state  : OnboardingState = .demo
    @StateObject var userConfigVM : UserConfigurationVM = UserConfigurationVM()
    var body: some View {
        switch state {
        case .demo:
            DemoView(state : $state)
        case .configuration:
            NotificationTimeView(userConfigVM: userConfigVM)
        case .payment:
            EmptyView()
        }
   
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
