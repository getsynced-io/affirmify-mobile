//
//  SocialMediaScreen.swift
//  Iffirmations
//
//  Created by Fares Cherni on 09/03/2023.
//

import SwiftUI

struct SocialMediaScreen: View  , SettingsViewProtocol{
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(spacing:0){
            SettingsHeaderView(title: "Social Media", cancelHandler: {
                withAnimation {
                    presentationMode.wrappedValue.dismiss()
                }
            })
            .padding(.bottom , 16)
            
            
            listRow(title: "Facebook") {
                "https://instagram.com/quottieapp".openUrl()
            }
            seperator
            
            listRow(title: "Instagram") {
                "https://www.facebook.com/quottieapp".openUrl()
            }
            seperator
            
            listRow(title: "Twitter") {
                "https://twitter.com/quottieapp".openUrl()
            }
            Spacer(minLength: 0)
        }
    }
}
