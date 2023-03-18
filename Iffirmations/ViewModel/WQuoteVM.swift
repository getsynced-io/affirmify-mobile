//
//  WQuoteVM.swift
//  Iffirmations
//
//  Created by Fares Cherni on 24/02/2023.
//

import SwiftUI

class WQuoteViewModel: ObservableObject{
    @Published var quotes : [WQuote] = []
    @Published var filtredQuotes : [WQuote] = []
    @AppStorage("favorite",store: store) var favoriteQuotes  : [ WQuoteFavorite] = []
    @AppStorage("sharedQuotes",store: store) var sharedQuotes  : [ WQuoteFavorite] = []
    @AppStorage("WidgetCategory",store: store) var category: String = ""
    @AppStorage("CategoryModelSelection",store: store) var selectedCategoryID: String = ""
    static let shared :  WQuoteViewModel =  WQuoteViewModel()
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
                        self?.sharedQuotes = self?.sharedQuotesComputedValue ?? []
                        self?.filtredQuotes = self?.filteredQuotesComputedValue ?? []
                }
            }
        } catch {
                print("error \(error)")
        }
        }
    }
    
    
    var sharedQuotesComputedValue : [WQuoteFavorite] {
        if category.isEmpty {
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
            }.prefix(1000).map { wQuote in
                WQuoteFavorite(quote: wQuote)
            }
            return Array(quotesToUse)

        }
        else {

            let quotesToUse  =    WQuoteViewModel.shared.quotes.filter { quote in
                 quote.categories.contains(category.lowercased())
             }.prefix(1000).map { wquote in
                 WQuoteFavorite(quote: wquote)
             }
            return Array(quotesToUse)

        }

    }
    
    
    var filteredQuotesComputedValue  : [WQuote] {

        let categories = CategoryViewModel.shared.categories.filter { innercat in
             return StoreViewModel.shared.subscriptionActive || !innercat.isPremium
         }

         let selectedCategories = selectedCategoryID.lowercased().isEmpty ? Set() : [selectedCategoryID.lowercased()]

         let quotesToUse = WQuoteViewModel.shared.quotes.filter { quote in
             !Set(quote.categories).isDisjoint(with: categories.map { $0.title.rawValue.lowercased() }) &&
             (selectedCategories.isEmpty || !Set(quote.categories).isDisjoint(with: selectedCategories))
         }

         return Array(quotesToUse.prefix(1000))
        
    }
    
    func updateFiltredQuotes(){
        let quotes = self.filteredQuotesComputedValue
        DispatchQueue.main.async {[weak self] in
            withAnimation {
                self?.filtredQuotes = quotes
        }
    }
    }

}
