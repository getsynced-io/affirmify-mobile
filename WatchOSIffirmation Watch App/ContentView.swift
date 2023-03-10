//
//  ContentView.swift
//  WatchOSIffirmation Watch App
//
//  Created by Fares Cherni on 09/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var wQuoteVM : WQuoteVMWHO = WQuoteVMWHO.shared
    @State var tabState : TabState = .main
    var body: some View {
        ZStack {
            //            Color.black
            //                .ignoresSafeArea()
            //            Text(quote?.text ?? "")
            //                .font(Font.custom("Inter-Medium", size: 16))
            //                .multilineTextAlignment(.center)
            //                .lineSpacing(4.6364)
            //                .padding(.horizontal, 8)
            //
            //                .task {
            //                    if let url = Bundle.main.url(forResource: "wquotes", withExtension: "plist") {
            //                        let data = try! Data(contentsOf: url)
            //                        let quotes = try! PropertyListDecoder().decode([WQuote].self, from: data)
            //                        self.quotes = quotes.filter { $0.text.count < 120}
            //                        quote = quotes.randomElement()
            //                    }
            //            }
            //        }.onTapGesture {
            //            quote = quotes.randomElement()
            //        }
            
            Color("000000")
                .ignoresSafeArea()
            if let  quote = wQuoteVM.currentQuote {
                Text("\(quote.text)")
                    .customFont(font: .InterMedium, size: 16, color: Color("FFFFFF"))
                    .padding(.horizontal, 8)
            }
          
            
        }
        .onTapGesture {
            wQuoteVM.randomQuote()
        }
    }
    
    func  tabItemView(type : TabState )->  some View {
        VStack(spacing: 8){
            Image("\(type.rawValue)")
                .frame(width: 24 , height: 24)
        }
        .frame(width: WKInterfaceDevice.current().screenBounds.size.width / 3.0,height: 48)
        .onTapGesture {
            tabState = type
        }
        
    }
}


enum TabState : String {
    case main , favorite, category
}
