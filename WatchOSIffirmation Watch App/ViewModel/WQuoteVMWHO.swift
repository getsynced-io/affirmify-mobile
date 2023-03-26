//
//  WquoteVMWHO.swift
//  WatchOSIffirmation Watch App
//
//  Created by Fares Cherni on 09/03/2023.
//

import SwiftUI

class WQuoteVMWHO: ObservableObject{
    @Published var quotes : [WQuote] = []
    @Published var quoteToUse  : [WQuote] = []
    @Published var currentQuote  : WQuote?
    @AppStorage("favorite") var favoriteQuotes  : [ WQuoteFavorite] = []
    static let shared : WQuoteVMWHO =  WQuoteVMWHO()
    
    init() {
        DispatchQueue.global().async {[weak self] in
            let info = ProcessInfo.processInfo
            let begin = info.systemUptime
            autoreleasepool {
                self?.protoBufParser()
            }
            let diff = (info.systemUptime - begin)
            print("diff \(diff)s")
        }
    }
    
    private  func protoBufParser(){
        if let path = Bundle.main.path(forResource: "file", ofType: "protobuf"){
            do {
                let protobufData = try Data(contentsOf: URL(fileURLWithPath: path))
                let totalQuotes =  try  WQuotes(serializedData: protobufData).quotes.shuffled()

                DispatchQueue.main.async {[weak self] in
                    withAnimation {
                        self?.quotes =  totalQuotes
                        self?.quoteToUse = self?.quoteToUseComputedValue(selectedID: "") ?? []
                        self?.randomQuote()
                }
            }
        } catch {
                print("error \(error)")
        }
        }
    }
    func quoteToUseComputedValue(selectedID : String) -> [WQuote] {
        let categories =    CategoryViewModel.shared.categories
        let quotesToUse: [WQuote]
        if selectedID == "" {
            quotesToUse = WQuoteVMWHO.shared.quotes
        }
        else {
            quotesToUse = WQuoteVMWHO.shared.quotes.filter { quote in
                return  quote.genre.lowercased() == selectedID
            }
        }
        
        return Array(quotesToUse.prefix(2000))
    }
    
    func randomQuote(){
        withAnimation {
            currentQuote = quoteToUse.randomElement()
        }
       
    }
    
}


