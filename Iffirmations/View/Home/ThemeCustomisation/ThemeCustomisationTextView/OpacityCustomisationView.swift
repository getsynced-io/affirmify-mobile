//
//  OpacityCustomisationView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 06/03/2023.
//

import SwiftUI

struct OpacityCustomisationView: View {
    @Binding var selectedTheme  : ThemeModel
    let stateUndoManager : StateUndoManager<ThemeModel>
    @Environment(\.presentationMode) var presentationMode
    var isBackGroundImage : Bool = false
    var body: some View {
        VStack(spacing: 0){
            ThemeCustomisationHeaderView(title: "Align"){
                presentationMode.wrappedValue.dismiss()
            }
        cancel: {
            stateUndoManager.undo()
            selectedTheme = stateUndoManager.currentState
            presentationMode.wrappedValue.dismiss()
        }
        .padding(.bottom , 32)
            
            QuoteCardView(selectedTheme: selectedTheme, quote: "If opportunity doesn't knock, build a door.",selectedItem:isBackGroundImage ? .image :  .text)
            
            
            Spacer(minLength: 0)
            VStack(spacing: 0){
                bottomView
               Spacer(minLength: 0)
              }
            .frame(height: 56)
            .padding(.top , 32)
            
            
            
        }
        .padding(.horizontal,16)
    }
    
    
    var bottomView : some View {
        VStack(spacing: 8){
            if isBackGroundImage {
                Text("\(Int(selectedTheme.backgroundOpacity * 100))%")
                    .customFont(font: .IBMPlexSerifRegular, size: 16, color: ._000000)
                
                SwiftUISlider(thumbColor: UIColor(named: "000000")!, value: $selectedTheme.backgroundOpacity , range:  0.0...1.0)
                    .frame(width: UIScreen.main.bounds.width - 32 , height: 24)
                    .padding(.bottom,8)
            }
            else{
                Text("\(Int(selectedTheme.fontOpacity * 100))%")
                    .customFont(font: .IBMPlexSerifRegular, size: 16, color: ._000000)
                
                SwiftUISlider(thumbColor: UIColor(named: "000000")!, value: $selectedTheme.fontOpacity, range:  0.0...1.0)
                    .frame(width: UIScreen.main.bounds.width - 32 , height: 24)
                    .padding(.bottom,8)
            }
       
        }
    }
    
}


