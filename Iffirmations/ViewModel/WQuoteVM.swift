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
                        print("totalQuotes \(totalQuotes.count)")
                        self?.sharedQuotes = self?.sharedQuotesComputedValue ?? []
                        self?.filtredQuotes = self?.filteredQuotesComputedValue( ) ?? []
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
                .map { category in
                    category.title.rawValue.lowercased()
                }

            let quotesToUse = WQuoteViewModel.shared.quotes.filter { quote in
                categories.contains(quote.genre)
            }.prefix(1000).map { wQuote in
                WQuoteFavorite(quote: wQuote)
            }
            return Array(quotesToUse)

        }
        else {

            let quotesToUse  =    WQuoteViewModel.shared.quotes.filter { quote in
                 //quote.categories.contains(category.lowercased())
                quote.genre == category
             }.prefix(1000).map { wquote in
                 WQuoteFavorite(quote: wquote)
             }
            return Array(quotesToUse)

        }

    }
    
    
    func  filteredQuotesComputedValue(categoryId : String = CategoryViewModel.shared.selectedID)  -> [WQuote] {

        let categories = CategoryViewModel.shared.categories.filter { innercat in
             return StoreViewModel.shared.subscriptionActive || !innercat.isPremium
         }
        .map { $0.title.rawValue.lowercased() }

        let selectedCat =  categoryId.lowercased()

        return    {
            var array : [WQuote] = []
            var index = 0
            for element in  WQuoteViewModel.shared.quotes {
                if filterLight(element){
                    array.append(element)
                  index += 1
                    if index ==  400{
                        break
                    }
                }
            }
            return array
        }()
    

    func filterLight(_ quote: WQuote) -> Bool {
           /// quote.genre == category && (selectedCategories.isEmpty || selectedCategories.contains(quote.genre))
        if selectedCat.isEmpty {
            return categories.contains(quote.genre)
        }
        else {
            return quote.genre == selectedCat
        }
    }

    }
    
    func updateFiltredQuotes(categoryId : String = CategoryViewModel.shared.selectedID,handler : @escaping ()->()){
        DispatchQueue.global().async {[weak self] in
            let info = ProcessInfo.processInfo
            let begin = info.systemUptime
            let quotes =  self?.filteredQuotesComputedValue(categoryId: categoryId) ?? []
            let diff = (info.systemUptime - begin)
            print("Filterdiff \(diff)s")
        DispatchQueue.main.async {[weak self] in
            self?.filtredQuotes = quotes
            handler( )
        }
        }
     
    }

}
