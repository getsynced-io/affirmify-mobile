//
//  FavoriteScreen.swift
//  Iffirmations
//
//  Created by Fares Cherni on 01/03/2023.
//

import SwiftUI

struct FavoriteScreen: View {
    @ObservedObject var wQuoteVM : WQuoteViewModel
    @Binding var isPresented : Bool
    @State  var loader : Bool = false
    @AppStorage("ThemeModelSelection",store: store) var ThemeiD : String = "0"
    var body: some View {
        ZStack{
            VStack(spacing: 0){
                headerView
                    .padding(.bottom , 16)
                ScrollView{
                    VStack(spacing: 0){
                        ForEach(wQuoteVM.favoriteQuotes, id: \.placeID){item in
                            VStack(spacing: 0){
                                quoteListRow(item)
                                    .padding(.vertical ,16)
                                if item.placeID != wQuoteVM.favoriteQuotes.last?.placeID {
                                    seperator
                                    
                                }
                            }
                        }
                    }
                }
                .padding(.bottom,16)
                
                Spacer(minLength: 0 )
            }
            
            if loader {
                Color._000000.opacity(0.16).ignoresSafeArea()
                    .zIndex(99)
                ProgressView()
                    .zIndex(99)
            }
        }
    }
    

    
    var headerView :some View {
        ZStack {
            HStack(spacing: 0){
                Button {
                    isPresented = false
                } label: {
                    Image("arrow-left")
                        .frame(width: 24,height: 24)
                }
                
                Spacer(minLength: 0)
            }
            
            Text("Favorites (\(wQuoteVM.favoriteQuotes.count))")
                .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                .frame(height: 24)
        }
        .frame(height: 44)
        .padding(.horizontal, 16)
        
     
    }
    
    var selectedTheme : ThemeModel {
        return   ThemeViewModel.shared.themes.filter { theme in
            theme.id == ThemeiD
        }.first ??  ThemeViewModel.shared.themes[0]
    }
    @Environment(\.mainWindowSize) var mainWindowSize
    func  quoteListRow(_ quote : any WQuoteBase)-> some View{
        HStack(alignment: .top,spacing: 0) {
            Text(quote.text)
                .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                .multilineTextAlignment(.leading)
            
           Spacer(minLength: 0)

          HStack(spacing: 16){
                ButtonImage24(title: "upload") {
                    withAnimation {
                        loader = true
                    }
                    
                 
                    let image = QuoteCardView(selectedTheme: selectedTheme, quote: quote.text,isForSnapshot: true).frame(width: UIScreen.main.bounds.width,height: mainWindowSize.height).snapshot()
                        
                        image.share {
                            withAnimation {
                                loader = false
                            }
                        }
                    
                   
                }

                ButtonImage24(title: "heart-filled") {
                        wQuoteVM.favoriteQuotes.removeAll { innerQuote in
                            innerQuote.placeID == quote.placeID
                        }
                }
            }
            .frame(width: 64 , height: 24)
            .padding(.leading, 16)
        }
        .padding(.horizontal, 16)
    }
    
}
