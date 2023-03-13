//
//  FavoriteQuotesView.swift
//  WatchOSIffirmation Watch App
//
//  Created by Fares Cherni on 13/03/2023.
//

import SwiftUI

struct FavoriteQuotesView: View {
    @AppStorage("favorite") var favoriteQuotes  : [ WQuoteFavorite] = []

    var body: some View {
        
        ZStack{
            Color("000000")
                .ignoresSafeArea()
            
            ScrollView(.vertical){
                ForEach(favoriteQuotes , id : \.placeID){ quote in
                    VStack(spacing: 8){
                        listrow(quote: quote)
                            .frame(height: 80)
                        if favoriteQuotes.last?.placeID != quote.placeID {
                            seperator
                        }
                    }
                 
                }
            }

            
        }

    }
    
    
    func  listrow(quote : WQuoteFavorite) ->  some View {
        Group{
            
            VStack(alignment: .leading,spacing: 8){
        
                    Text("\(quote.text)")
                        .customFont(font: .InterMedium, size: 16, color: Color("FFFFFF"))
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .minimumScaleFactor(0.5)
                Button {
                    withAnimation {
                      
                            if favoriteQuotes.contains(where: { fQuote in
                                fQuote.placeID == quote.placeID
                            }) {
                                favoriteQuotes.removeAll { fQuote in
                                    fQuote.placeID == quote.placeID
                                }
                            }
                        
                    }
                } label: {
                    Image(isFavorite(favQuote: quote) ? "heart-filled" : "heart")
                        .frame(width: 24 ,height: 24)
                        .clipped()
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal , 8)
        
            
        
            
        }
    }
    
    func isFavorite(favQuote : WQuoteFavorite) -> Bool {
        favoriteQuotes.contains { quote in
            quote.placeID == favQuote.placeID
        }
    }
    var seperator : some View {
    Rectangle()
            .frame(width:  WKInterfaceDevice.current().screenBounds.width ,height: 1)
            .foregroundColor(Color("FFFFFF").opacity(0.16))
            .clipped()
    }
    
}
