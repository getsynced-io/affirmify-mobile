//
//  LegalScreen.swift
//  Iffirmations
//
//  Created by Fares Cherni on 09/03/2023.
//

import SwiftUI

struct LegalScreen: View , SettingsViewProtocol {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(spacing:0){
            SettingsHeaderView(title: "Legal", cancelHandler: {
                withAnimation {
                    presentationMode.wrappedValue.dismiss()
                }
            })
            .padding(.bottom , 16)
            
            
            listRow(title: "Privacy Policy") {
                "https://www.quottie.app/privacy".openUrl()
            }
            seperator
            
            listRow(title: "Terms & Conditions") {
                "https://www.quottie.app/terms".openUrl()
            }
            Spacer(minLength: 0)
        }
    }
}

