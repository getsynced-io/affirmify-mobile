//
//  GenralView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 25/02/2023.
//

import SwiftUI

struct GenralView: View {
    @ObservedObject var wQuoteVM : WQuoteViewModel
    @ObservedObject var themeVM : ThemeViewModel
    @State var index : Int  = 0
    @AppStorage("ThemeModelSelection") var ThemeiD : String = "0"
    @Binding var settingsIsPresented: Bool
    var selectedTheme : ThemeModel {
      return  themeVM.themes.filter { theme in
            theme.id == ThemeiD
        }.first ?? themeVM.themes[0]
    }
    

    @AppStorage("CategoryModelSelection") var selectedCategoryID: String = ""
    @State var showPaymentView : Bool = false
    var body: some View {
            VStack(spacing: 0){
                headerView
                    .padding(.horizontal,16)
                    .padding(.bottom , 32)
                
                paginationView
                
                
            }
        .fullScreenCover(isPresented: $showPaymentView) {
            PaymentView(isPresented: $showPaymentView)
        }
        
    }
    
    
    var headerView : some View {
        ZStack{
            HStack(spacing: 0){
                ButtonImage24(title: "upload") {}
                
                Spacer(minLength: 0)
                
                ButtonImage24(title: "settings") {withAnimation {settingsIsPresented = true}}
            }
            HStack(spacing: 16){
                
                ButtonImage24(title: "crown") {withAnimation {showPaymentView = true}}
                
                if !selectedCategoryID.isEmpty{
                    selectedCategoryTag
                }
            }
           
        }
        .frame(width: UIScreen.main.bounds.width - 32,height: 44)
        
    }
    
    var selectedCategoryTag : some View {
        let category  = CategoryViewModel.shared.categories.filter { category  in
            category.title.rawValue == selectedCategoryID
        }.first ??  CategoryViewModel.shared.categories[0]
      return   HStack(spacing: 4){
          Text("\(category.title.rawValue)")
              .customFont(font: .IBMPlexSerifMedium, size: 12,lineHeight: 16, color: ._FFFFFF)
          Button {
              withAnimation {
                  selectedCategoryID = ""
              }
          } label: {
              Image("xWhite")
                  .frame(width: 16,height: 16)
                  .clipped()
          }

 
        }
      .padding(.vertical,4)
      .padding(.horizontal,8)
      .background(
        Capsule()
            .frame(height: 24)
            .foregroundColor(._000000)
      
      )
    }
    var filteredQuotes  : [WQuote] {
        if selectedCategoryID.isEmpty{
            return wQuoteVM.quotes
        }
        else {
            return   wQuoteVM.quotes.filter { quote in
                quote.categories.contains(selectedCategoryID.lowercased())
              }
        }
    }
    
    var paginationView : some View {
        
        ScrollView(.horizontal,showsIndicators: false){
            LazyHStack(spacing: 0){
                ForEach(filteredQuotes, id : \.placeID) { item in
                    ZStack(alignment: .topTrailing){
                    
                        
                        
                        QuoteCardView(selectedTheme: selectedTheme, quote: item.text)
                        
                        .tag(item.placeID)
                        
                    Button {
                        withAnimation {
                            favoriteAction(quote: item )
                            
                        }
                        
                    }
                    label: {
                        Image(isItFavorite(quote: item) ?  "heart-filled" : "heart")
                        
                    }
                            .frame(width: 24,height: 24)
                            .padding(16)
                            .padding(.trailing,16)
                        
                    }
                    .padding(.bottom,32)
                    
                }
            }
            
        }
        .introspectScrollView(customize: { view in
            view.isPagingEnabled = true
        })
    }
    
    func isItFavorite(quote : WQuote)->Bool {
        wQuoteVM.favoriteQuotes.contains(where: { innerQuote in
            innerQuote.placeID == quote.placeID
        })
    }
    
    func favoriteAction(quote : WQuote ){
        if wQuoteVM.favoriteQuotes.contains(where: { innerQuote in
            innerQuote.placeID == quote.placeID
        }){
            wQuoteVM.favoriteQuotes.removeAll {  innerQuote in
                quote.placeID ==  innerQuote.placeID
                
            }
            HapticManager.instance.impact(style: .light)
        }
        else {
                let quoteToADD: WQuoteFavorite = WQuoteFavorite(quote: quote)
                wQuoteVM.favoriteQuotes.append(quoteToADD)
                HapticManager.instance.impact(style: .light)
        }
      
    }
}
//correct miss use of map


struct QuoteCardView: View {
    enum SelectedItem {
        case none , text , image
    }
    var selectedTheme : ThemeModel
    var textAlignment : SwiftUI.TextAlignment {
        switch selectedTheme.fontAlignment {
        case .left  : return .leading
        case .middle : return .center
        case .right : return .trailing
        }
    }
    var quote : String
    var selectedItem : SelectedItem = .none
    var body: some View {
        ZStack{
            Group{
                if let image = selectedTheme.backgroundImage {
                    Image("\(image)")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width - 32)
                        .cornerRadius(16)
                        .if(selectedItem == .image , transform: { view in
                            view
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .strokeBorder(lineWidth: 1, antialiased: true)
                                        .foregroundColor(Color._000000)
                                )
                        })
                      
                }
                else if let color =   selectedTheme.backgroundColor{
                    color
                        .cornerRadius(16)
                        .if(selectedItem == .image , transform: { view in
                            view
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .strokeBorder(lineWidth: 1, antialiased: true)
                                        .foregroundColor(Color._000000)
                                )
                        })
                }
            }
            .frame(width: UIScreen.main.bounds.width - 32)
            .opacity(Double(selectedTheme.backgroundOpacity))
  
           quoteView
            
            
        }
        .frame(maxWidth: UIScreen.main.bounds.width - 32)
        .padding(.horizontal, 16)
    }
    
    var quoteView : some View {
            Text(quote)
                .customFont(font: FontsExtension(fromRawValue: selectedTheme.fontName), size: 24, color: selectedTheme.fontColor)
                .padding(.horizontal, 16)
                .multilineTextAlignment(textAlignment)
                .opacity(selectedTheme.fontOpacity)
                .foregroundColor(selectedTheme.fontColor)
                .frame(width: UIScreen.main.bounds.width - 64)
                .if(selectedItem == .text , transform: { view in
                    view
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .strokeBorder(lineWidth: 1, antialiased: true)
                                .foregroundColor(Color._000000)
                        )
                })
             
    }
}

