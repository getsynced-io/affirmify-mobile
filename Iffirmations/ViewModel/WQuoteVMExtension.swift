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
        let quotesToUse = WQuoteViewModel.shared.quotes.filter { quote in
            quote.categories.contains { cat in
            return categories.contains { innercat in
                return  innercat.title.rawValue.lowercased() == cat
          
                }
                
            }
        }
        return quotesToUse
    }
}
