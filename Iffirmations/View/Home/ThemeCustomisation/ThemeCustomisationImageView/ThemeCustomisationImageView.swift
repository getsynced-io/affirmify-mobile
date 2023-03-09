//
//  ThemeCustomisationImageView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 06/03/2023.
//

import SwiftUI

struct ThemeCustomisationImageView: View {
    @Binding var selectedTheme  : ThemeModel
    let stateUndoManager : StateUndoManager<ThemeModel>
    @State var pushView : Bool = false
    @State var viewToPush : AnyView  = AnyView(EmptyView())
    @Environment(\.presentationMode) var presentationMode
    @State private var showingActionSheet = false
    @State private var showingPhotoPicker = false
    
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
            
            QuoteCardView(selectedTheme: selectedTheme, quote: "If opportunity doesn't knock, build a door.",selectedItem: .image)
            
            
            Spacer(minLength: 0)
            
            bottomView
                .frame(height: 56)
                .padding(.top , 32)
            
            
            nextView
        }
        .padding(.horizontal,16)
        .sheet(isPresented: $showingPhotoPicker) {
            PhotoPicker { results in
                let ary = results.map({ result in
                    result.itemProvider
                })
                for provider in ary  {
                    provider.getImagePath { result in
                        withAnimation {
                
                            selectedTheme.backgroundImage = result
                            
                        }
                    }
                }
                
                
                
            }
        }
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
            TabItemView(imageTitle: "replace", title: "Image", count: 3){
                withAnimation {
                    showingActionSheet = true
                }
            }
            TabItemView(imageTitle: "paint", title: "Color", count: 3){
                withAnimation {
                    viewToPush = AnyView(ColorCustomisationView(selectedTheme: $selectedTheme, stateUndoManager: StateUndoManager(initialState: selectedTheme),isBackGroundImage: true) )
                    pushView = true
                }
            }
            TabItemView(imageTitle: "chart-circles", title: "Opacity", count: 3){
                withAnimation {
                    viewToPush = AnyView(OpacityCustomisationView(selectedTheme: $selectedTheme, stateUndoManager: StateUndoManager(initialState: selectedTheme),isBackGroundImage: true) )
                    pushView = true
                }
            }
         
        }
        .actionSheet(isPresented: $showingActionSheet) {
                   ActionSheet(title: Text("Select an option"), message: nil, buttons: [
                       .default(Text("Random Background")) {
                           withAnimation {
                               changeBackgroundImage()
                           }
                       },
                       .default(Text("Choose From Library")) {
                           withAnimation {
                               showingPhotoPicker = true
                           }
                       },
                       .cancel()
                   ])
               }
        
        
    }
    
    
    func changeBackgroundImage() {
        let randomNumber = "\(Int.random(in: 1...100))"
        let randomBackgroundName = "ThemeBg\(randomNumber)"
        selectedTheme.backgroundImage = randomBackgroundName
    }
    

    
    
}
