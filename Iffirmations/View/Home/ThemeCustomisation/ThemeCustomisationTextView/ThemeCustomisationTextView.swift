//
//  ThemeCustomisationTextView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 02/03/2023.
//

import SwiftUI



struct ThemeCustomisationTextView: View {
    @Binding var selectedTheme  : ThemeModel
    let  oldTheme : ThemeModel
    @State var pushView : Bool = false
    @State var viewToPush : AnyView  = AnyView(EmptyView())
    @Environment(\.presentationMode) var presentationMode
    init(selectedTheme: Binding<ThemeModel>, oldTheme: ThemeModel) {
        print("oldTheme \(oldTheme)")
        self._selectedTheme = selectedTheme
        self.oldTheme = oldTheme
    }
    var body: some View {
        VStack(spacing: 0){
            nextView
        
            
            ThemeCustomisationHeaderView(title: "Text"){
                presentationMode.wrappedValue.dismiss()
            }
            cancel : {
                selectedTheme  = oldTheme
            }
                .padding(.bottom , 32)
            
            QuoteCardView(selectedTheme: selectedTheme, quote: "If opportunity doesn't knock, build a door.",selectedItem: .text)
            
            
            Spacer(minLength: 0)
            
            bottomView
                .frame(height: 56)
                .padding(.top , 32)
            
            
        }
        .padding(.horizontal,16)
    }
    
    var nextView : some View {
        CustomNavigationLink(isActive: $pushView) {
            viewToPush
                .background(
                    Color._F6F5EC.ignoresSafeArea()
                )
        }
    }
    
    var bottomView : some View {
        HStack(spacing: 0){
            TabItemView(imageTitle: "typography", title: "Font", count: 5){
                withAnimation {
                    viewToPush = AnyView( )
                    pushView = true
                }
            }
            TabItemView(imageTitle: "align-center", title: "Align", count: 5){
                
            }
            TabItemView(imageTitle: "paint", title: "Color", count: 5){
                
            }
            TabItemView(imageTitle: "chart-circles", title: "Opacity", count: 5){
                
            }
            TabItemView(imageTitle: "letter-case", title: "Text", count: 5){
                
            }
        }
    }
}



