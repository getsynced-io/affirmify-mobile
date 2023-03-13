//
//  Categories.swift
//  WatchOSIffirmation Watch App
//
//  Created by Fares Cherni on 10/03/2023.
//

import SwiftUI

struct CategoriesView: View ,ListRowExtension{
    @State var viewToPush : AnyView = AnyView(EmptyView())
    @State var pushView  : Bool  = false
    @ObservedObject var wQuoteVM : WQuoteVMWHO
    var body: some View {
        VStack(spacing: 0){
            nextView.buttonStyle(.plain)
            VStack(spacing : 8) {
                ScrollView {
                    ForEach(CategoryViewModel.shared.categories , id : \.title) { category in
                        tabSelectionView(type: category.title.rawValue) {
                           // print("category.title.rawValue \(category.title.rawValue)")
                          //  wQuoteVM.quoteToUse = []
                            wQuoteVM.quoteToUse = wQuoteVM.quoteToUseComputedValue(selectedID: category.title.rawValue)
                            wQuoteVM.randomQuote()
                            withAnimation {
                                viewToPush = AnyView(QuotesView(wQuoteVM: wQuoteVM))
                                pushView = true
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
    var nextView : some View {
        Group {
            NavigationLink(isActive: $pushView) {
                viewToPush
                    .background(
                        Color("000000").ignoresSafeArea()
                    )
            } label: {

            }

            
        }
        
    }
}
