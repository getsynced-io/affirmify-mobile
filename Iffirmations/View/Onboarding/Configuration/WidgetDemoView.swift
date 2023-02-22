//
//  WidgetDemoScreen.swift
//  Iffirmations
//
//  Created by Fares Cherni on 21/02/2023.
//

import SwiftUI

struct WidgetDemoView: View {
    @Environment(\.presentationMode) var presentation
    @State var nextViewIsActive : Bool = false
    var body: some View {
        VStack(spacing: 0){
            nextView
            backButtom
                .padding(.bottom , 32)
            
            Text("How to add widget to the Home Screen on your iPhone?")
                .customFont(font: .IBMPlexSerifMedium, size: 24, color: Color._000000)
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 0)
            
            Text("Touch and hold the Home Screen background until the apps begin to jiggle, then drag apps and widgets to rearrange them.\nYou can also drag widgets on top of each other to create a stack you can scroll through.")
                .customFont(font: .IBMPlexSerifRegular, size: 16, color: Color._000000)
                .multilineTextAlignment(.center)
                .padding(.bottom,56)
            
            GreenButtonView(buttonTitle: "Next") {
                withAnimation {
                    nextViewIsActive = true
                }
            }
            .padding(.bottom,32)
            
        }
        .padding(.horizontal , 16)
        .background(Color._F6F5EC)
    }
    
    var nextView : some View {
        CustomNavigationLink(isActive: $nextViewIsActive) {
          CategorySelectionView()
        }
    }
    
    var backButtom : some View{
        
        HStack(spacing: 0){
            Button {
                self.presentation.wrappedValue.dismiss()
            } label: {
                Image("arrow-left")
                    .frame(width: 24,height: 24)
            }

            Spacer(minLength: 0)
        }
        .frame(height: 44)
    }
}
