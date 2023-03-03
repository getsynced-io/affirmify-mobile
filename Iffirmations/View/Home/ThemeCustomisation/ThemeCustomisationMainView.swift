//
//  ThemeCustomisationMainView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 02/03/2023.
//

import SwiftUI

struct ThemeCustomisationMainView: View {
    @State var selectedTheme  : ThemeModel  = ThemeViewModel.shared.getDefaultTheme()
    @State var showTextEdit : Bool = false
    @State var showImageEdit : Bool = false
    var body: some View {
        VStack(spacing: 0){
            nextView
            
            ThemeCustomisationHeaderView(title: "Customize", saveAaction: {
             
            })
                .padding(.bottom , 32)
            
                QuoteCardView(selectedTheme: selectedTheme, quote: "If opportunity doesn't knock, build a door.")
            
            
            Spacer(minLength: 0)
            
            bottomView
                .frame(height: 56)
                .padding(.top , 32)
            
            
        }
        .padding(.horizontal,16)
    }
    
    var nextView : some View {
        Group {
            CustomNavigationLink(isActive: $showTextEdit) {
                ThemeCustomisationTextView(selectedTheme: $selectedTheme,oldTheme: selectedTheme)
                    .background(
                        Color._F6F5EC.ignoresSafeArea()
                    )
            }
        }
    }
    
    var bottomView : some View {
        HStack(spacing: 0){
            TabItemView(imageTitle: "cursor-text", title: "Text", count: 2){
                withAnimation {
                    showTextEdit = true
                }
            }
            TabItemView(imageTitle: "photo", title: "Image", count: 2){
                
            }
        }
    }
    
  
}


struct TabItemView: View {
    let imageTitle: String
    let title: String
    let count: CGFloat
    let action : ()->()
    var body: some View {
        Button {
            action()
        } label: {
            
            VStack(spacing: 8){
                Image(imageTitle)
                    .frame(width: 24,height: 24)
                Text(title)
                    .customFont(font: .IBMPlexSerifMedium, size: 16 , color: ._000000)
                
            }
        }
        .frame(width: UIScreen.main.bounds.width / count,height: 56)
    }
}



struct ThemeCustomisationHeaderView: View {
    let title : String
    @Environment(\.presentationMode) var presentationMode
    var saveAaction : ()->()
    var cancel : ()->() = {}
    var body: some View {
            ZStack{
                HStack(spacing: 0){
                    ButtonImage24(title: "arrow-left") {
                        cancel()
                        presentationMode.wrappedValue.dismiss()
                    }
                    
                    Spacer(minLength: 0)
                    Button {
                        saveAaction()
                    } label: {
                        Text("Save")
                              .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                              .frame(width: 36,height: 24)
                    }

          
                }
                
                Button {
                 saveAaction()
                 presentationMode.wrappedValue.dismiss()
                } label: {
                    Text(title)
                          .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                          .frame(height: 24)
                }
            
               
            }
            .frame(width: UIScreen.main.bounds.width - 32,height: 44)
    }
}

