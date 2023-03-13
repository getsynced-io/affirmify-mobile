//
//  QuotesView.swift
//  WatchOSIffirmation Watch App
//
//  Created by Fares Cherni on 10/03/2023.
//

import SwiftUI

struct QuotesView: View {
    @AppStorage("favorite") var favoriteQuotes  : [ WQuoteFavorite] = []
    var isFavorite : Bool {
        favoriteQuotes.contains { quote in
            quote.placeID == wQuoteVM.currentQuote?.placeID
        }
    }
    @ObservedObject var wQuoteVM : WQuoteVMWHO
    var body: some View {
        
        ZStack{
            Color("000000")
                .ignoresSafeArea()
            
            VStack(spacing: 0){
                if let  quote = wQuoteVM.currentQuote {
                    Text("\(quote.text)")
                        .customFont(font: .InterMedium, size: 16, color: Color("FFFFFF"))
                        .padding(.horizontal, 8)
                        .onTapGesture {
                            wQuoteVM.currentQuote = wQuoteVM.quoteToUse.randomElement()
                        }
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
                        .frame(height: 72)
                        .minimumScaleFactor(0.5)
                    
                }
            }
        
            
            VStack(spacing: 0){
                Spacer(minLength: 0)
                
                HStack(spacing: 8) {
                    Spacer(minLength: 0)
                    Button {
                        withAnimation {
                            if let currentQuote = wQuoteVM.currentQuote {
                                if favoriteQuotes.contains(where: { fQuote in
                                    fQuote.placeID == currentQuote.placeID
                                }) {
                                    favoriteQuotes.removeAll { fQuote in
                                        fQuote.placeID == currentQuote.placeID
                                    }
                                }
                                else {
                                    favoriteQuotes.append(WQuoteFavorite(quote: currentQuote))
                                }
                              
                            }
                        }
                    } label: {
                        Image(isFavorite ? "heart-filled" : "heart")
                            .frame(width: 24 ,height: 24)
                    }
                    .buttonStyle(.plain)

    
                    Image("copy")
                        .frame(width: 24 ,height: 24)
                    Spacer(minLength: 0)
                }
            }
            
            
        }

    }
    
    
}
