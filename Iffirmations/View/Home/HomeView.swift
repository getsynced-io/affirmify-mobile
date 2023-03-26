//
//  HomeView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 25/02/2023.
//

import SwiftUI
import Intents
import SwiftUIPager 
enum TabState : String {
    case General , Categories ,  Themes
}


struct HomeView: View {
    @State var tabState  : TabState = .General
    @ObservedObject var wQuoteVM : WQuoteViewModel
    @StateObject var themeVM : ThemeViewModel = ThemeViewModel.shared
    @AppStorage("FirstTime",store: store) var firstTime : Bool  = true
   // @AppStorage("widgetSelectedUrlQuote",store: store) var widgetSelectedId :Int? = nil
    @State var settingsIsPresented: Bool = false
    @State var showPaymentView : Bool = false
    @State var adsPopUpView : AnyView = AnyView(EmptyView())
    @State var adsPopUpIsPresented : Bool = false
    @State var loader : Bool = false
 

    var body: some View {
        NavigationView {
            ZStack {
                nextView
                VStack(spacing: 0){
                   
                    
                    ZStack{
                        GenralView(wQuoteVM: wQuoteVM,themeVM: themeVM,settingsIsPresented: $settingsIsPresented, loader: $loader,tabState: $tabState)
                            .onAppear {
                                INPreferences.requestSiriAuthorization { status in
                                    
                                }
                            }
                            .background(
                                Color._000000.ignoresSafeArea()
                            )
                            .zIndex(tabState == .General ? 1 : -1)
                            .ignoresSafeArea(.keyboard , edges: .bottom)
                        
                            CategoriesView(tabState: $tabState,adsPopUpView: $adsPopUpView,adsPopUpIsPresented: $adsPopUpIsPresented)
                                .background(
                                    Color._000000.ignoresSafeArea()
                                )
                                .zIndex(tabState == .Categories ? 2 : -2)
                                .ignoresSafeArea(.keyboard , edges: .bottom)
                        
                            ThemesView(adsPopUpView: $adsPopUpView,adsPopUpIsPresented: $adsPopUpIsPresented)
                                .background(
                                    Color._000000.ignoresSafeArea()
                                )
                                .zIndex(tabState == .Themes ? 3 : -3)
                                .ignoresSafeArea(.keyboard , edges: .bottom)
                    }
                    
                    BottomSelectionView
                        .zIndex(999)
                        .ignoresSafeArea(.keyboard , edges: .bottom)
                        .background(
                            Color._000000
                                .ignoresSafeArea()
                        )
                    
                }
                .ignoresSafeArea(.keyboard , edges: .bottom)
                .background(
                    Color._000000
                        .ignoresSafeArea()
                        .ignoresSafeArea(.keyboard , edges: .bottom)
                )
                if firstTime {
                    Color._FFFFFF.opacity(0.16).ignoresSafeArea()
                    firstTimeNotation
                    
                }
                if  adsPopUpIsPresented  {
                    Color._FFFFFF.opacity(0.16).ignoresSafeArea()
                    
                    adsPopUpView
                    
                }
                
                if loader {
                    Color._FFFFFF.opacity(0.16).ignoresSafeArea()
                        .zIndex(99)
                    ProgressView()
                        .zIndex(99)
                }
            }
            .fullScreenCover(isPresented: $showPaymentView) {
                PaymentView(isPresented: $showPaymentView)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            
          }
        .onOpenURL { url in
            if url.absoluteString.contains("Iffirmation://openQuote?quoteId="){
                if  let quoteId = url.queryParameters["quoteId"] {
                    if   let quote = wQuoteVM.quotes.first(where: { innerQuote in
                        innerQuote.placeID ==  Int32(quoteId)
                    }) {
                            wQuoteVM.filtredQuotes.removeAll { innerQuote in
                                innerQuote.placeID == quote.placeID
                            }
                        NavigationUtil.popToRootView() 
                        wQuoteVM.filtredQuotes.insert(quote, at: 0)
                        tabState = .General
                        NotificationCenter.default.post(name:  NSNotification.scrollToFirst , object: nil, userInfo: nil)
                        
                    }
                }
            }
            
        }
        
    }
    
    var nextView : some View {
        CustomNavigationLink(isActive: $settingsIsPresented) {
            GeneralSettingsView(isPresented: $settingsIsPresented,wQuoteVM: wQuoteVM )
                .background(
                    Color._F6F5EC.ignoresSafeArea()
                )
        }
       
    }
    
    

    
    var firstTimeNotation : some View {
        VStack(spacing: 32) {
            
           Image("🌎")
                .frame(width: 77,height: 96)
            
            Text("Swipe left or right to read more quotes")
                .customFont(font: .InterMedium, size: 24, color: ._FFFFFF)
                .multilineTextAlignment(.center)
            
            GreenButtonView(buttonTitle: "Gotcha!",width:  UIScreen.main.bounds.width - 96) {
                withAnimation {
                    firstTime = false
                }
            }
            
        }
        .padding(.vertical,32)
        .padding(.horizontal,16)
        .frame(width: UIScreen.main.bounds.width - 64,height: 336)
        .background(Color._000000)
        .cornerRadius(32)
        .padding(.horizontal,32)
    }

    
    var BottomSelectionView : some View {
        HStack(spacing : 0){
            tabItemView(type: .General)
            tabItemView(type: .Categories)
            tabItemView(type: .Themes)
        }
    }
    func  tabItemView(type : TabState )->  some View {
        VStack(spacing: 8){
            Text("\(type.rawValue)")
                .customFont(font: .InterMedium, size: 16, color: ._FFFFFF)
                .opacity(type == tabState ? 1 : 0.64)
                .frame(height: 24)
            
            if type == tabState {
                Circle()
                    .frame(width: 8,height: 8)
                    .foregroundColor(._FFFFFF)
            }
            Spacer(minLength: 0)
        }
        .frame(width: UIScreen.main.bounds.width / 3.0,height: 48)
        .onTapGesture {
            tabState = type
            if tabState == .Themes {
                NotificationCenter.default.post(name: NSNotification.scrollToTheme,
                                                               object: nil, userInfo: nil)
            }
        }
        
    }
    
    
}





struct ButtonImage24: View {
    let title : String
    var animated : Bool = true
   
    let action : ()->()
    var body: some View {
        Button {
            if animated {
                withAnimation {
                    action()
                }
            }
            else{
                action()
            }
       
        } label: {
            Image(title)
                .frame(width: 24,height: 24)
                .clipped()
        }
    }
}



struct GoPremiumPopUpView: View {
    let emoji : String
    let description : String
    let mainButtonTitle : String
    let secondButtonTitle : String
    var showExitButton : Bool = true
    @Binding var isPresented : Bool
    let handler : ()->()
    let secondHandler : ()->()
    var body: some View {
        ZStack(alignment: .topTrailing){
            VStack(spacing: 32) {
              Image("\(emoji)")
                    .frame(width: 96,height: 96)
                    .clipped()
                   
                
                Text(description)
                    .customFont(font: .InterMedium, size: 24, color: ._FFFFFF)
                    .multilineTextAlignment(.center)
                   
                
                VStack(spacing: 16){
                    GreenButtonView(buttonTitle: mainButtonTitle,width:  UIScreen.main.bounds.width - 96) {
                        handler()
                    }
                    
                    Button {
                        withAnimation {
                            secondHandler()
                        }
                    } label: {
                        Text(secondButtonTitle)
                            .customFont(font: .InterMedium , size: 16, color: ._FFFFFF)
                    }
                    .frame(height: 24)
                    
                    
                }
            }
            .padding(.vertical,32)
            .padding(.horizontal,16)
            .frame(width: UIScreen.main.bounds.width - 64,height: UIDevice.current.userInterfaceIdiom == .phone ?  376 : 344)
            .background(Color._000000)
            .cornerRadius(32)
            
            if showExitButton {
                Button {
                    withAnimation {
                        isPresented =  false
                    }
                } label: {
                    Image("xBlack")
                        .frame(width: 24,height: 24)
                }
                .padding(16)
            }
        }
      
       
        .padding(.horizontal,32)
    }
}





extension URL {
    var queryParameters: [String: String] {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true),
              let queryItems = components.queryItems else {
            return [:]
        }
        return queryItems.reduce(into: [:]) { result, queryItem in
            result[queryItem.name] = queryItem.value
        }
    }
}
