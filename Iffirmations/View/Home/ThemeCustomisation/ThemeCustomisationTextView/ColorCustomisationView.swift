//
//  ColorCustomisationView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 06/03/2023.
//

import SwiftUI

struct ColorCustomisationView: View {
    @Binding var selectedTheme  : ThemeModel
    let stateUndoManager : StateUndoManager<ThemeModel>
    @Environment(\.presentationMode) var presentationMode
    var isBackGroundImage : Bool = false
    let colors : [String] = ["000000","E4F2FD","8ECAF9","44A5F5","1F87E5","1266C0","82B2FF","2A79FF","F1F8E9","C6E1A6","9CCC64","7AB441","548B2F","CDFF91","76FF02"
        ,"FFFFFF","90C9F9","64B5F6","2196F3","1876D1","0D47A1","448AFF","2A62FD","DBEDC8","AED581","8CC14B","679F37","33691C","B2FF59","65DC19"
    ]
    var columns: [GridItem] {
          Array(repeating: .init(.fixed(28),spacing: 0), count: 15)
      }
      

    var body: some View {
        VStack(spacing: 0){
            ThemeCustomisationHeaderView(title: "Color"){
                presentationMode.wrappedValue.dismiss()
            }
        cancel: {
            stateUndoManager.undo()
            selectedTheme = stateUndoManager.currentState
            presentationMode.wrappedValue.dismiss()
        }
        .padding(.bottom , 32)
            
            QuoteCardView(selectedTheme: selectedTheme, quote: "If opportunity doesn't knock, build a door.",selectedItem: isBackGroundImage ? .image : .text)
            
            
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
    let maxItemsPerRow = 15
    var bottomView : some View {
        HStack(spacing: 0){
 
            ScrollView(.horizontal,showsIndicators: false){
            
                LazyVGrid(columns: columns, spacing: 0) {
                           ForEach(colors, id: \.self) { item in
                               colorIcon(item)
                           }
                       }
                   }
        }
    }
    
    func  colorIcon(_ color : String)->  some View {
        
        
        ZStack{
            Circle()
            .foregroundColor(Color(color))
            .frame(width: 28,height: 28)
            
            Circle()
                .strokeBorder(Color("000000"), lineWidth: 1)
                .frame(width: 28,height: 28)
                .opacity(0.16)
            if isBackGroundImage {
                if selectedTheme.backgroundColor == color {
                    Circle()
                        .foregroundColor(color  == "000000" ? Color("FFFFFF")  : Color("000000"))
                        .frame(width: 8,height: 8)
                }
            }
            else {
                if selectedTheme.fontColor ==  color {
                    Circle()
                        .foregroundColor(color  == "000000" ? Color("FFFFFF")  : Color("000000"))
                        .frame(width: 8,height: 8)
                }
            }
       
      
        }
        .onTapGesture {
            withAnimation {
                if isBackGroundImage {
                    selectedTheme.backgroundColor = color
                    selectedTheme.backgroundImage = nil
                }
                else {
                    selectedTheme.fontColor =  color
                }
               
            }
        }
        
        
        
    }
    

    
}

