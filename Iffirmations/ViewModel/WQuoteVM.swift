//
//  WQuoteVM.swift
//  Iffirmations
//
//  Created by Fares Cherni on 24/02/2023.
//

import SwiftUI

class WQuoteViewModel: ObservableObject{
    @Published var quotes : [WQuote] = []

    func jsonParser(_  category : QuoteCategory){
        if let path = Bundle.main.path(forResource: "\(category.rawValue)", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                let decoder = JSONDecoder()
                let quotes = try decoder.decode([WQuote].self, from: data)
                print(quotes)
                DispatchQueue.main.async {[weak self] in
                    withAnimation {
                        self?.quotes = quotes
                    }
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("File not found.")
        }
    }
}
