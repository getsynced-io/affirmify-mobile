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

    var seperator : some View {
    Rectangle()
            .frame(width: UIScreen.main.bounds.width,height: 1)
            .foregroundColor(Color._000000.opacity(0.16))
            .clipped()
    
    }
    var body: some View {
        VStack(spacing: 0){
            headerView
                .padding(.bottom , 16)
            ScrollView{
                ForEach(wQuoteVM.favoriteQuotes, id: \.placeID){item in
                    VStack(spacing: 0){
                        quoteListRow(item)
                        if item.placeID != wQuoteVM.favoriteQuotes.last?.placeID {
                            seperator
                        }
                    }
                }
            }
            
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
        HStack(spacing: 0) {
            Text(quote.text)
                .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                .multilineTextAlignment(.leading)
            
            Spacer(minLength: 0)

          HStack(spacing: 16){
                ButtonImage24(title: "upload") {
                    
                }
          
                
                ButtonImage24(title: "heart-filled") {
                    withAnimation {
                        wQuoteVM.favoriteQuotes.removeAll { innerQuote in
                            innerQuote.placeID == quote.placeID
                        }
                    }
                }
            }
            .frame(width: 64 , height: 24)
            .padding(.leading , 16)
        }
        .padding(16)
    }
    
}
