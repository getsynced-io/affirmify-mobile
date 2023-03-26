//
//  WQuoteVMExtension.swift
//  Iffirmations
//
//  Created by Fares Cherni on 08/03/2023.
//

import SwiftUI

extension WQuoteViewModel {
    var freeQuotes : [WQuote] {
        let categories =    CategoryViewModel.shared.categories.filter { innercat in
               if StoreViewModel.shared.subscriptionActive {
                return  true
               }
               else {
                   return   !innercat.isPremium
               }
               
           }
            .map { category in
                category.title.rawValue.lowercased()
            }

        let quotesToUse = WQuoteViewModel.shared.quotes.filter { quote in
            categories.contains(quote.genre)
        }
        return quotesToUse
    }
}
