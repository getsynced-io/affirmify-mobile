//
//  AllignmentCustomisationView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 03/03/2023.
//

import SwiftUI

struct AllignmentCustomisationView: View {
    @Binding var selectedTheme  : ThemeModel
    let stateUndoManager : StateUndoManager<ThemeModel>
    @Environment(\.presentationMode) var presentationMode
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
            
            QuoteCardView(selectedTheme: selectedTheme, quote: "If opportunity doesn't knock, build a door.",selectedItem: .text)
            
            
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
        HStack(spacing: 0){
 
            TabItemView(imageTitle: "align-left", title: "Left", count: 3){
                withAnimation {
                    selectedTheme.fontAlignment = .left
                }
            }
            TabItemView(imageTitle: "align-center", title: "Center", count: 3){
                withAnimation {
                    selectedTheme.fontAlignment = .middle
                }
            }
            TabItemView(imageTitle: "align-right", title: "Right", count: 3){
                withAnimation {
                    selectedTheme.fontAlignment = .right
                }
            }
           
        }
    }
    
    
}

