//
//  GenralView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 25/02/2023.
//

import SwiftUI

struct PagginableScrollView<Content>: View where Content: View {
    var views: Content

    init(@ViewBuilder content: () -> Content) {
        self.views = content()
    }

    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            views
                .animation(nil)
        }
        .introspectScrollView { scrollView in
            scrollView.isPagingEnabled = true
        }
       
    }
}



struct GenralView: View {
    @ObservedObject var wQuoteVM : WQuoteViewModel
    @ObservedObject var themeVM : ThemeViewModel
    @State var index : Int  = 0
    @AppStorage("ThemeModelSelection",store: store) var ThemeiD : String = "0"
    @Binding var settingsIsPresented: Bool
    var selectedTheme : ThemeModel {
      return  themeVM.themes.filter { theme in
            theme.id == ThemeiD
        }.first ?? themeVM.themes[0]
    }
    

    @AppStorage("CategoryModelSelection",store: store) var selectedCategoryID: String = ""
    @State var showPaymentView : Bool = false
    @State var sendImage : Bool = false
    @Binding  var loader : Bool 
    var body: some View {
        ZStack{
            VStack(spacing: 0){
                headerView
                    .padding(.horizontal,16)
                    .padding(.bottom , 32)
                
                paginationView
                
                
            }
       
        }
        .fullScreenCover(isPresented: $showPaymentView) {
            PaymentView(isPresented: $showPaymentView)
        }
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.categoryIntent))
              { obj in
                 // Change key as per your "userInfo"
                  if let userInfo = obj.userInfo, let info = userInfo["category"] as? String {
                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 ){
                          withAnimation {
                              selectedCategoryID = info
                          }
                      }
                   
                   
                 }
              }
        
    }
    
   
    
    var headerView : some View {
        ZStack{
            HStack(spacing: 0){
                ButtonImage24(title: "upload") {
                    withAnimation {
                        loader = true
                    }
                    
                    if let item = curentItem {
                        let image = QuoteCardView(selectedTheme: selectedTheme, quote: item.text,isForSnapshot: true).frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height).snapshot()
                        
                        image.share {
                            withAnimation {
                                loader = false
                            }
                        }
                    }
                   
                }
                
                Spacer(minLength: 0)
                
                ButtonImage24(title: "settings") {withAnimation {settingsIsPresented = true}}
            }
            HStack(spacing: 16){
                
                ButtonImage24(title: "crown"){
                    if !StoreViewModel.shared.subscriptionActive {
                        withAnimation {showPaymentView = true}
                        
                        
                    }
                }
                .disabled(StoreViewModel.shared.subscriptionActive )
                
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
              wQuoteVM.updateFiltredQuotes()
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
    @State var curentItem : WQuote?
    
    var paginationView : some View {
        ScrollViewReader { proxy in
       
        PagginableScrollView{
       
            LazyHStack(spacing: 0){
              
                ForEach(wQuoteVM.filtredQuotes, id : \.placeID) { item in
                   
                    ZStack(alignment: .topTrailing){

                        QuoteCardView(selectedTheme: selectedTheme, quote: item.text)
                            .onAppear(perform: {
                                curentItem  = item
                            })
                        
                        
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
                    .id(wQuoteVM.filtredQuotes.firstIndex(of: item) ?? 0 )
                }
            }
        }
        .onChange(of: wQuoteVM.filtredQuotes) { newValue in
            proxy.scrollTo(0,anchor: .top)
        }
            
        }

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
    var finalQuote : String {
        switch selectedTheme.textCase {
        case .sentence : return quote
        case .lowerCase : return quote.lowercased()
        case .upperCase : return quote.uppercased()
        }
        
    }
    @Environment(\.mainWindowSize) var mainWindowSize
    var isForSnapshot : Bool = false
    var body: some View {
        ZStack{
            Group{
                if let image = selectedTheme.backgroundImage {
                    backGroundImage(image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width -  (isForSnapshot ?  0 : 32))
                        .if(!isForSnapshot) {view in
                            view
                            .frame(maxHeight:  mainWindowSize.height - 44 - 64 - 64)
                            
                        }
                        .cornerRadius(isForSnapshot ?  0 : 16)
                        .if(selectedItem == .image , transform: { view in
                            view
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .strokeBorder(lineWidth: 1, antialiased: true)
                                        .foregroundColor(Color._000000)
                                )
                        })
                            .if(isForSnapshot){view in
                            view
                                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                            
                        }
                      
                }
                else if let color =   selectedTheme.backgroundColor{
                    Color(color)
                        .cornerRadius(isForSnapshot ?  0 : 16)
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
            .frame(width: UIScreen.main.bounds.width -  (isForSnapshot ?  0 : 32))
            .opacity(Double(selectedTheme.backgroundOpacity))
  
           quoteView
            
            
        }
        .frame(maxWidth: UIScreen.main.bounds.width - (isForSnapshot ?  0 : 32))
        .padding(.horizontal, isForSnapshot ?  0 : 16)
    }
    func backGroundImage(_ path : String)->  Image {
        if path.contains("CustomImage") {
            if let image =  LocalFileManager.instance.retrieveImageFromFile(filename: path) {
                return   Image(uiImage: image)
            }
            else {
                let randomNumber = "\(Int.random(in: 1...100))"
                let randomBackgroundName = "ThemeBg\(randomNumber)"
                return Image("\(randomBackgroundName)")
            }
         
        }
        else{
            return Image(path)
        }
    }
    
    var quoteView : some View {
            Text(finalQuote)
                .customFont(font: FontsExtension(fromRawValue: selectedTheme.fontName), size: 24, color: Color(selectedTheme.fontColor))
                .padding(.horizontal, 16)
                .multilineTextAlignment(textAlignment)
                .opacity(selectedTheme.fontOpacity)
                .foregroundColor(Color(selectedTheme.fontColor))
                .frame(width: UIScreen.main.bounds.width - 64)
                .if(selectedItem == .text , transform: { view in
                    view
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .strokeBorder(lineWidth: 1, antialiased: true)
                                .foregroundColor(Color._000000)
                        )
                })
                    .padding(.vertical , 16)
    }
}

