//
//  WQuoteVM.swift
//  Iffirmations
//
//  Created by Fares Cherni on 24/02/2023.
//

import SwiftUI

class WQuoteViewModel: ObservableObject{
    @Published var quotes : [WQuote] = []
    @AppStorage("favorite") var favoriteQuotes  : [Int32] = []
    
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

                let wquotes: WQuotes
                wquotes = try WQuotes(serializedData: protobufData)
                DispatchQueue.main.async {[weak self] in
                    withAnimation {
                        self?.quotes = wquotes.quotes
//                        print("quotes \(self?.quotes.count)")
                    }
                }
                
            } catch {
                print("error \(error)")
            }
        }
    }

}
