//
//  GenralView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 25/02/2023.
//

import SwiftUI
import SwiftUIPager

extension UIView {
   var safeAreaHeight: CGFloat {
       if #available(iOS 11, *) {
        return safeAreaLayoutGuide.layoutFrame.size.height
       }
       return bounds.height
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
    

  
    @State var showPaymentView : Bool = false
    @State var sendImage : Bool = false
    @Binding var loader : Bool
    @Binding var tabState  : TabState
  
    var body: some View {
        ZStack{
            VStack(spacing: 0){
                headerView
                    .padding(.horizontal,16)
                
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
//                      DispatchQueue.main.asyncAfter(deadline: .now() + 0.3 ){
                          withAnimation {
                              CategoryViewModel.shared.selectedID = info
                              WQuoteViewModel.shared.updateFiltredQuotes(categoryId: info) {
                                  tabState = .General
                              }
                              
                          }
//                      }
                   
                   
                 }
              }
        
    }
    
   
    @Environment(\.mainWindowSize) var mainWindowSize
    var headerView : some View {
        ZStack{
            HStack(spacing: 0){
                ButtonImage24(title: "upload") {
                    withAnimation {
                        loader = true
                    }
                    
                    if let item = curentItem {
                        let image = QuoteCardView(selectedTheme: selectedTheme, quote: item.text,isForSnapshot: true).frame(width: UIScreen.main.bounds.width,height: mainWindowSize.height).snapshot()
                        
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
                if !StoreViewModel.shared.subscriptionActive {
                    ButtonImage24(title: "crown"){
                        if !StoreViewModel.shared.subscriptionActive {
                            withAnimation {showPaymentView = true}
                        }
                    }
                    .disabled(StoreViewModel.shared.subscriptionActive )
                }
                if !CategoryViewModel.shared.selectedID.isEmpty{
                    selectedCategoryTag
                     
                }
            }
           
        }
        .frame(width: UIScreen.main.bounds.width - 32,height: 44)
        
    }
    
    var selectedCategoryTag : some View {
        let category  = CategoryViewModel.shared.categories.filter { category  in
            category.title.rawValue ==  CategoryViewModel.shared.selectedID
        }.first ??  CategoryViewModel.shared.categories[0]
      return   HStack(spacing: 4){
          Text("\(category.title.rawValue)")
              .customFont(font: .InterMedium, size: 12,lineHeight: 16, color: ._FFFFFF)
          Button {
              CategoryViewModel.shared.selectedID = ""
              DispatchQueue.global().async {
                  wQuoteVM.updateFiltredQuotes(categoryId : "" ){
                      
                  }
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
        RoundedRectangle(cornerRadius: 8)
            .frame(height: 24)
            .foregroundColor(._5138EE)
      
      )
    }
    @State var curentItem : WQuote?

    var paginationView : some View {

        Group{
           
                pagginationContentView
            
         
       
        }
        .onChange(of: wQuoteVM.filtredQuotes) { newValue in
            page.update(.moveToFirst)
        }
        .onReceive(NotificationCenter.default.publisher(for: NSNotification.scrollToFirst))
              { _ in
                  page.update(.moveToFirst)
              }
        
    

    }
    @StateObject var page: Page = .first()
    var pagginationContentView : some View {

            Pager(page: page , data: wQuoteVM.filtredQuotes, id: \.placeID) { item in
                LazyHStack(spacing: 0){
                quoteFullCard(item: item)
                    .padding(.vertical, 32)
                }
            }
            .sensitivity(.high)
            .draggingAnimation(.custom(animation: .spring()))
            .contentLoadingPolicy(.lazy(recyclingRatio: 10))
        
    }
    
    func quoteFullCard(item : WQuote) -> some View  {
        ZStack(alignment: .topTrailing){

            QuoteCardView(selectedTheme: selectedTheme, quote: item.text,isForEdit: false)
                .onAppear(perform: {
                    curentItem  = item
                })
                .frame(width: UIScreen.main.bounds.width -   32, height: UIScreen.main.bounds.height - 44 - 64 - 48 - top - bottom)
                .clipped()
                
          
                          
            likeButton(quote: item)
                .offset(x : -16,y: 16)
             
           
           
     
               

        }
        
       
    }
    
    func  likeButton(quote item : WQuote)-> some View  {
        VStack(spacing:0){
            Group{
                if isItFavorite(quote: item){
                    customImageView(size: CGSize(width: 24,height: 24), color: UIColor(named: "000000")!, alpha: 1, x: 0, y: 0, blur: 8, image: UIImage(named: "heart-filled")!)
                }
                else {
                    customImageView(size: CGSize(width: 24,height: 24), color: UIColor(named: "000000")!, alpha: 1, x: 0, y: 0, blur: 8, image: UIImage(named: "heart")!)
                      
                }
            }
            .frame(width: 24 ,height: 24)
          
                .onTapGesture {
                    withAnimation {
                        favoriteAction(quote: item )

                    }
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
            let quoteToADD: WQuoteFavorite =  WQuoteFavorite(quote:quote)
                wQuoteVM.favoriteQuotes.append(quoteToADD)
                HapticManager.instance.impact(style: .light)
        }
      
    }
}
//correct miss use of map

let top    = UIApplication.shared.windows[0].safeAreaInsets.top
let bottom = UIApplication.shared.windows[0].safeAreaInsets.bottom

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
    var textAlignmentPadding : CGFloat {
        switch selectedTheme.fontAlignment {
        case .left  : return 0
        case .middle : return  16.0
        case .right : return 0
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
    var isForEdit : Bool = true

    var body: some View {
        ZStack{
            Group{
                if let image = selectedTheme.backgroundImage {
                    backGroundImage(image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width -  (isForSnapshot ?  0 : 32))
                        .if(!isForSnapshot && isForEdit ){view in
                            view
                                .frame(maxHeight : mainWindowSize.height - 44  - 64 - 64)
                        }
                        .if(!isForSnapshot && !isForEdit ){view in
                            view
                                .frame(height: UIScreen.main.bounds.height - 44 - 64 - 48 - top - bottom)
                              
                        }
                      
                        .cornerRadius(isForSnapshot ?  0 : 8)
                        .opacity(Double(selectedTheme.backgroundOpacity))
                        .animation(nil)
                        .contentShape(Rectangle())
                        .clipped()
                        .if(selectedItem == .image , transform: { view in
                            view
                               
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .strokeBorder(lineWidth: 1, antialiased: true)
                                        .foregroundColor(Color._FFFFFF)
                                )
                        })
                        .if(isForSnapshot){view in
                            view
                                .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                            
                        }
                 
                      
                }
                else if let color =   selectedTheme.backgroundColor{
                    Color(color)
                        .cornerRadius(isForSnapshot ?  0 : 8)
                        .opacity(Double(selectedTheme.backgroundOpacity))
                        .if(selectedItem == .image , transform: { view in
                            view
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .strokeBorder(lineWidth: 1, antialiased: true)
                                        .foregroundColor(Color._FFFFFF)
                                )
                        })
                            .if(isForSnapshot){view in
                                view
                                    .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
                                
                            }
                     
                }
                
                
  
            }
            .frame(width: UIScreen.main.bounds.width -  (isForSnapshot ?  0 : 32))
         
  
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
        VStack(spacing: 0){
            Text(finalQuote)
                .customFont(font: FontsExtension(fromRawValue: selectedTheme.fontName), size: 24, color: Color(selectedTheme.fontColor))
                .padding(.horizontal, textAlignmentPadding)
                .multilineTextAlignment(textAlignment)
                .opacity(selectedTheme.fontOpacity)
                .foregroundColor(Color(selectedTheme.fontColor))
                .frame(width: UIScreen.main.bounds.width - 64,alignment: textAlignment.alinment)
                .fixedSize(horizontal: false , vertical: true)
                .if(selectedItem == .text , transform: { view in
                    view
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .strokeBorder(lineWidth: 1, antialiased: true)
                                .foregroundColor(Color._FFFFFF)
                               
                        )
                })
                    .padding(.vertical , 16)
                    
                    
                    if !StoreViewModel.shared.subscriptionActive && isForSnapshot {
                    Text("Quottie.app")
                        .customFont(font: .InterMedium, size: 16, color:Color(selectedTheme.fontColor).opacity(0.64))
                        .padding(.bottom , 16)
                }
            
        }
    }
}

extension TextAlignment {
    
    var alinment : Alignment {
        switch self {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }
}
