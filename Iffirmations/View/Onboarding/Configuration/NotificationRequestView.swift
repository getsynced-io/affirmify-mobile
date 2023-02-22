//
//  NotificationRequestView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 21/02/2023.
//

import SwiftUI

struct NotificationRequestView: View {
    @State var nextViewIsActive : Bool = false
    @Environment(\.presentationMode) var presentation
    var body: some View {
        VStack(spacing: 0){
            nextView
            
            backButtom
                .padding(.bottom , 32)
            
            description
            
            Spacer(minLength: 0)
            
            VStack(spacing: 16){
                doItNowButton
                doItLaterButton
            }
            .padding(.bottom,32)
        }
        .padding(.horizontal , 16)
        .background(Color._F6F5EC)

    }
    
    var nextView : some View {
        CustomNavigationLink(isActive: $nextViewIsActive) {
            WidgetDemoView()
        }
    }
    
    var doItNowButton : some View {
        GreenButtonView(buttonTitle: "Let’s Do It!") {
            withAnimation {
                nextViewIsActive = true
            }
        }
    }
    
    var doItLaterButton : some View {
        Button {
            withAnimation {
                nextViewIsActive = true
            }
        } label: {
            Text("I'll Do It Later")
                .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                .frame(height: 24)
            
        }

    }
    
    
    var description : some View {
        Text("Turn on notifications to make it a habit to review quotes every day")
            .customFont(font: .IBMPlexSerifMedium, size: 24, color: Color._000000)
            .multilineTextAlignment(.center)
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

struct NotificationRequestView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationRequestView()
    }
}
