//
//  GenralView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 25/02/2023.
//

import SwiftUI

struct GenralView: View {
    @ObservedObject var wQuoteVM : WQuoteViewModel
    @ObservedObject var themeVM : ThemeViewModel
    @State var index : Int  = 0
    @AppStorage("CategoryModelSelection") var ThemeiD : String = "0"
    var selectedTheme : ThemeModel {
        themeVM.themes.filter { theme in
            theme.id == ThemeiD
        }.first ?? themeVM.themes[0]
    }
    
    var textAlignment : SwiftUI.TextAlignment {
        switch selectedTheme.fontAlignment {
        case .left  : return .leading
        case .middle : return .center
        case .right : return .trailing
        }
    }
    var body: some View {
        VStack(spacing: 0){
            headerView
                .padding(.horizontal,16)
                .padding(.bottom , 32)
            
            paginationView
        
            
        }
    }
    
    
    var headerView : some View {
        ZStack{
            HStack(spacing: 0){
                ButtonImage24(title: "upload") {}
                
                Spacer(minLength: 0)
                
                ButtonImage24(title: "settings") {}
            }
            
            ButtonImage24(title: "crown") {}
        }
        .frame(width: UIScreen.main.bounds.width - 32,height: 44)
       
    }
    
    var paginationView : some View {
     
        ScrollView(.horizontal,showsIndicators: false){
            LazyHStack(spacing: 0){
                ForEach(wQuoteVM.quotes, id : \.placeID) { item in
                    
                    ZStack {
                        Group{
                            if let image = selectedTheme.backgroundImage {
                                Image("\(image)")
                                    .resizable()
                                    .scaledToFit()
                                    .cornerRadius(16)
                            }
                            else if let color =   selectedTheme.backgroundColor{
                                color
                                    .cornerRadius(16)
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width - 32)
                        
                        Text(item.text)
                            .customFont(font: .IBMPlexSerifMedium, size: 24, color: ._000000)
                            .padding(.horizontal, 16)
                            .multilineTextAlignment(textAlignment)
                            .opacity(selectedTheme.fontOpacity)
                            .foregroundColor(selectedTheme.fontColor)
                        
                        
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width - 32)
                    .padding(.horizontal, 16)
                    .tag(item.placeID)
                    .padding(.bottom,32)
                    
                }
            }
            
        }
        .introspectScrollView(customize: { view in
            view.isPagingEnabled = true
            //view.contentSize =  CGSize(width:  Int(UIScreen.main.bounds.width)  * wQuoteVM.quotes.count , height: 500)
           
        })
 
    
    }
}
