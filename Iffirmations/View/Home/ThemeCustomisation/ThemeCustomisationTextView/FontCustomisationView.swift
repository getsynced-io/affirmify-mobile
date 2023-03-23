//
//  FontCustomisationView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 02/03/2023.
//

import SwiftUI

struct FontCustomisationView: View {
    @Binding var selectedTheme  : ThemeModel
    let stateUndoManager : StateUndoManager<ThemeModel>
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(spacing: 0){
            ThemeCustomisationHeaderView(title: "Font"){
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
            .frame(height: 64)
            .padding(.top , 32)
      
            
            
        }
        .padding(.horizontal,16)
    } 
    
    var bottomView : some View {
        ScrollViewReader { value in
            ScrollView(.horizontal, showsIndicators : false ) {
                HStack(spacing:16){
                    ForEach(InitThemes.shared.fontNames , id: \.self) {item in
                        fontCard(item){
                            withAnimation {
                                value.scrollTo(selectedTheme.fontName,anchor: .center)
                            }
                             
                        }
                            .id(item)
                    }
                }
            }
            .onAppear {
                value.scrollTo(selectedTheme.fontName,anchor: .center)
            }
           
        }
    }
    
    
    func fontCard(_ fontName : String,handler : @escaping ()->()) ->  some View {
        Text("Abcd")
            .customFont(font: FontsExtension(fromRawValue: fontName), size: 24, color: ._FFFFFF )
            .background(
                Group{
                       RoundedRectangle(cornerRadius: 8)
                        .if(fontName != selectedTheme.fontName, transform: { view in
                                view
                                    .strokeBorder(lineWidth: 1)
                            })
                            .foregroundColor(fontName == selectedTheme.fontName ? ._5138EE : ._FFFFFF.opacity(0.16))
                            .frame(width: 128, height: 48)

                }
            )
            .frame(width: 128, height: 56)
            .onTapGesture {
                    selectedTheme.fontName = fontName
                    handler()
            }
        
    }
}


