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


    var body: some View {
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
    
    
    func  quoteListRow(_ quote : any WQuoteBase)-> some View{
        HStack(alignment: .top,spacing: 0) {
            Text(quote.text)
                .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                .multilineTextAlignment(.leading)
            
            Spacer(minLength: 0)

          HStack(spacing: 16){
                ButtonImage24(title: "upload") {
                    
                }
          
                
                ButtonImage24(title: "heart-filled") {
                        wQuoteVM.favoriteQuotes.removeAll { innerQuote in
                            innerQuote.placeID == quote.placeID
                        }
                }
            }
            .frame(width: 64 , height: 24)
        }
        .padding(.horizontal, 16)
    }
    
}
