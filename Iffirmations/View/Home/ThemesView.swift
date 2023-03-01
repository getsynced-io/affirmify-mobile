//
//  ThemesView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 28/02/2023.
//

import SwiftUI

struct ThemesView: View {
    @ObservedObject  var themeVM : ThemeViewModel
    let columns = [
          GridItem(.flexible(), spacing: 16),
          GridItem(.flexible(), spacing: 16)
      ]
    var columnWidth : CGFloat {
        ((UIScreen.main.bounds.width  - 48) / 2.0)
    }
    var body: some View {
        VStack(spacing: 0) {
            headerView
            ZStack(alignment: .bottomTrailing){
                ScrollView{
                    themesMenue
                        .padding(.bottom,32)
                }
                Button {
                    
                } label: {
                    Image("CTA")
                        .frame(width: 48,height: 48)
                        .padding(16)
                }


            }
        }
    }
    
    var themesMenue : some View {
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(themeVM.themes, id: \.id) { theme in
                Button {
                    withAnimation {
                        themeVM.ThemeiD = theme.id
                    }
                } label: {
                    themeCard(theme)
                }
                    .padding(.top,16)
            }
        }
        .padding(.horizontal , 16 )
    }
    
    func themeCard( _ theme: ThemeModel)-> some View{
        Group{
            ZStack{
                ZStack(alignment: .topTrailing){
                    if let color = theme.backgroundColor {
                        color
                            .frame(width: columnWidth,height: columnWidth)
                            .cornerRadius(16)
                        
                    }
                    else if let imageTitle = theme.backgroundImage{
                        Image(imageTitle)
                            .resizable()
                            .scaledToFill()
                            .frame(width: columnWidth,height: columnWidth)
                            .cornerRadius(16)
                        
                    }
                    
                    Image(theme.id == themeVM.ThemeiD ?  "circle-check" : "circle")
                        .frame(width: 24,height: 24)
                        .padding(8)
                    
                }
                Text("Abcd")
                    .customFont(font:FontsExtension(fromRawValue: theme.fontName) , size: 24 , color: theme.fontColor)
            }
        }
    }
    var headerView: some View {
        ZStack{
            HStack(spacing: 0){
                Button {
                    
                } label: {
                    Text("Reset")
                        .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                }
                
                Spacer(minLength: 0)
                Button {
                    
                } label: {
                    Text("Edit")
                         .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                }

            }
            
            ButtonImage24(title: "crown") {}
        }
        .frame(width: UIScreen.main.bounds.width - 32,height: 44)
        
    }
}

