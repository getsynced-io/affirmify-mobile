//
//  ThemeCustomisationMainView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 02/03/2023.
//

import SwiftUI
import WidgetKit

struct ThemeCustomisationMainView: View {
    @State var selectedTheme  : ThemeModel  = ThemeViewModel.shared.getDefaultTheme()
    var stateUndoManager : StateUndoManager<ThemeModel> = StateUndoManager(initialState: ThemeViewModel.shared.getDefaultTheme())
    @State var showTextEdit : Bool = false
    @State var showImageEdit : Bool = false
    @Environment(\.presentationMode) var presentationMode
    var index: String? = nil
    var body: some View {
        VStack(spacing: 0){
          
            
            ThemeCustomisationHeaderView(title: "Customize"){
                
                
                if let index = index {
//                    withAnimation {
                        let intIndex = ThemeViewModel.shared.themes.firstIndex { theme in
                            theme.id == index
                        }
                        if let intIndex = intIndex {
                            ThemeViewModel.shared.themes[intIndex] = selectedTheme
                        }

//                    }
                }
                else {
//                    withAnimation {
                        ThemeViewModel.shared.themes.insert(selectedTheme, at: 0)
                        ThemeViewModel.shared.ThemeiD = selectedTheme.id
//                    }
                }
                
                DispatchQueue.main.async {
                    print("update2 widgetKit \(ThemeViewModel.shared.ThemeiD)")
                    WidgetCenter.shared.reloadAllTimelines()
                }
                
                presentationMode.wrappedValue.dismiss()
             
            }
            cancel : {
                presentationMode.wrappedValue.dismiss()
            }
                .padding(.bottom , 32)
                QuoteCardView(selectedTheme: selectedTheme, quote: "If opportunity doesn't knock, build a door.")
            
            
            Spacer(minLength: 0)
            
            bottomView
                .frame(height: 64)
                .padding(.top , 32)
            
            nextView
            
        }
        .padding(.horizontal,16)
    }
    
    var nextView : some View {
        Group {
            CustomNavigationLink(isActive: $showTextEdit) {
                ThemeCustomisationTextView(selectedTheme: $selectedTheme,stateUndoManager:  stateUndoManager)
                    .background(
                        Color._F6F5EC.ignoresSafeArea()
                    )
            }
            
            CustomNavigationLink(isActive: $showImageEdit) {
                ThemeCustomisationImageView(selectedTheme: $selectedTheme,stateUndoManager:  stateUndoManager)
                    .background(
                        Color._F6F5EC.ignoresSafeArea()
                    )
            }
        }
    }
    
    var bottomView : some View {
        HStack(spacing: 0){
            TabItemView(imageTitle: "cursor-text", title: "Text", count: 2){
                stateUndoManager.reset(initialState: selectedTheme)
                withAnimation {
                    showTextEdit = true
                }
            }
            TabItemView(imageTitle: "photo", title: "Image", count: 2){
                stateUndoManager.reset(initialState: selectedTheme)
                withAnimation {
                    showImageEdit = true
                }
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
                    .customFont(font: .InterMedium, size: 16 , color: ._FFFFFF)
                
            }
        }
        .frame(width: UIScreen.main.bounds.width / count,height: 56)
    }
}



struct ThemeCustomisationHeaderView: View {
    let title : String
    var saveAaction : ()->()
    var cancel : ()->() = {}
    var body: some View {
            ZStack{
                HStack(spacing: 0){
                    ButtonImage24(title: "arrow-left") {
                        cancel()
                    }
                    
                    Spacer(minLength: 0)
                    Button {
                        saveAaction()
                    } label: {
                        Text("Save")
                              .customFont(font: .InterMedium, size: 16, color: ._FFFFFF)
                              .frame(width: 38,height: 24)
                    }

          
                }
                
              
                    Text(title)
                          .customFont(font: .InterMedium, size: 16, color: ._FFFFFF)
                          .frame(height: 24)
            
               
            }
            .zIndex(999)
            .frame(width: UIScreen.main.bounds.width - 32,height: 44)
    }
}

