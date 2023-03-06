//
//  ThemeCustomisationTextView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 02/03/2023.
//

import SwiftUI



struct ThemeCustomisationTextView: View {
    @Binding var selectedTheme  : ThemeModel
    let stateUndoManager : StateUndoManager<ThemeModel>
    @State var pushView : Bool = false
    @State var viewToPush : AnyView  = AnyView(EmptyView())
    @Environment(\.presentationMode) var presentationMode
  
    init(selectedTheme: Binding<ThemeModel>,stateUndoManager : StateUndoManager<ThemeModel>) {
        self._selectedTheme = selectedTheme
        self.stateUndoManager = stateUndoManager
    }
    var body: some View {
        VStack(spacing: 0){

        
            
            ThemeCustomisationHeaderView(title: "Text"){
                presentationMode.wrappedValue.dismiss()
            }
            cancel : {
                stateUndoManager.undo()
                selectedTheme = stateUndoManager.currentState
                presentationMode.wrappedValue.dismiss()
            }
                .padding(.bottom , 32)
            
            QuoteCardView(selectedTheme: selectedTheme, quote: "If opportunity doesn't knock, build a door.",selectedItem: .text)
            
            
            Spacer(minLength: 0)
            
            bottomView
                .frame(height: 56)
                .padding(.top , 32)
            
            nextView
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
                    viewToPush = AnyView(FontCustomisationView(selectedTheme: $selectedTheme, stateUndoManager: StateUndoManager(initialState: selectedTheme)) )
                    pushView = true
                }
            }
            TabItemView(imageTitle: "align-center", title: "Align", count: 5){
                withAnimation {
                    viewToPush = AnyView(AllignmentCustomisationView(selectedTheme: $selectedTheme, stateUndoManager: StateUndoManager(initialState: selectedTheme)) )
                    pushView = true
                }
            }
            TabItemView(imageTitle: "paint", title: "Color", count: 5){
                withAnimation {
                    viewToPush = AnyView(ColorCustomisationView(selectedTheme: $selectedTheme, stateUndoManager: StateUndoManager(initialState: selectedTheme)) )
                    pushView = true
                }
            }
            TabItemView(imageTitle: "chart-circles", title: "Opacity", count: 5){
                withAnimation {
                    viewToPush = AnyView(OpacityCustomisationView(selectedTheme: $selectedTheme, stateUndoManager: StateUndoManager(initialState: selectedTheme)) )
                    pushView = true
                }
            }
            TabItemView(imageTitle: "letter-case", title: "Text", count: 5){
                withAnimation {
                    selectedTheme.textCase =    selectedTheme.textCase.next()
                }
            }
        }
    }
}



