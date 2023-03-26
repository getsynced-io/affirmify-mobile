//
//  GeneralSettingsView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 01/03/2023.
//

import SwiftUI
import StoreKit
 
protocol SettingsViewProtocol {

}

extension SettingsViewProtocol {
    func listRow(title : String,action :@escaping ()->()) ->  some View {
        Button {
            action()
        } label: {
            HStack(spacing: 0){
               Text(title)
                    .customFont(font: .InterMedium, size: 16, color: ._FFFFFF)
                    .frame(height: 24)
                Spacer(minLength: 0)
                Image("chevron-right")
                    .frame(width: 24,height: 24)
                
            }
        }
        .padding(16)
        .frame(height: 56)
    }
    
    func listRowLocker(title : String,isLocked : Bool,action :@escaping ()->()) ->  some View {
        Button {
            action()
        } label: {
            HStack(spacing: 0){
               Text(title)
                    .customFont(font: .InterMedium, size: 16, color: ._FFFFFF)
                    .frame(height: 24)
                Spacer(minLength: 0)
                
                Image(isLocked ?  "lock" : "chevron-right")
                    .renderingMode(.template)
                    .foregroundColor(Color._FFFFFF)
                    .frame(width: 24,height: 24)
                
            }
        }
        .padding(16)
        .frame(height: 56)
        .disabled(isLocked)
    }
}


struct GeneralSettingsView: View  , SettingsViewProtocol{
    @AppStorage("favorite",store: store) var favoriteQuotes  : [ WQuoteFavorite] = []
    @Binding var isPresented : Bool
    @ObservedObject var wQuoteVM : WQuoteViewModel
    @State var pushView : Bool = false
    @State var viewToPush : AnyView  = AnyView(EmptyView())
    @State var showPaymentView : Bool = false
 
    var body: some View {
        ZStack{
            Color._000000.ignoresSafeArea()
        VStack(spacing: 0){
              nextView
            
                        SettingsHeaderView(title: "Settings", cancelHandler: {
                            withAnimation {
                                isPresented = false
                            }
                        })
                            .padding(.bottom , 16)
                        Group{
                            listRow(title: "Favorites (\(favoriteQuotes.count))") {
                                withAnimation {
                                    viewToPush = AnyView(FavoriteScreen(wQuoteVM: wQuoteVM, isPresented: $pushView))
                                    pushView = true
                                }
                            }
                           seperator
            
                            listRow(title: "Settings") {
                                withAnimation {
                                    viewToPush = AnyView(SettingsScreen())
                                    pushView = true
                                }
                            }
                        seperator
                        }
                        Group{
                            listRow(title: "Share App") {
                                "https://apps.apple.com/us/app/quottie/id1603440570".shareAsUrl()
                            }
                           seperator
            
                            listRow(title: "Rate Us") {
                                SKStoreReviewController.requestReview()
                            }
                           seperator
                        }
            
                            listRow(title: "Restore") {
                                withAnimation {
                                    showPaymentView = true
                                }
                            }
                           seperator
            
                        Group{
                            listRow(title: "Contact") {
                                "support@quottie.app".mailTo()
                            }
                            seperator
            
                            listRow(title: "Legal") {
                                withAnimation {
                                    viewToPush = AnyView(LegalScreen())
                                    pushView = true
                                }
                            }
                            seperator
                        }
            
                            listRow(title: "Social Media") {
                                withAnimation {
                                    viewToPush = AnyView( SocialMediaScreen())
                                    pushView = true
                                }
                            }
            
                        HStack(spacing: 0) {
                            Text("v1.0")
                                .customFont(font: .InterRegular, size: 12,lineHeight: 16 , color: ._FFFFFF.opacity(0.64))
                                .padding(16)
                            Spacer(minLength: 0)
                        }
            
            
                        Spacer(minLength: 0)
            
            
            
            
        }
        .background(Color._000000.ignoresSafeArea())
    }
        .fullScreenCover(isPresented: $showPaymentView) {
            PaymentView(isPresented: $showPaymentView)
        }

    }
    
    var nextView : some View {
        CustomNavigationLink(isActive: $pushView) {
            viewToPush
                .background(
                    Color._F6F5EC.ignoresSafeArea()
                )
        }
    }
    

    
}


struct SettingsHeaderView: View {
    let title : String
    let cancelHandler : ()->()
    var body: some View {
            ZStack {
                HStack(spacing: 0){
                    Button {
                        cancelHandler()
                    } label: {
                        Image("arrow-left")
                            .frame(width: 24,height: 24)
                    }
                    
                    Spacer(minLength: 0)
                }
                
                Text(title)
                    .customFont(font: .InterMedium, size: 16, color: ._FFFFFF)
                    .frame(height: 24)
            }
            .frame(height: 44)
            .padding(.horizontal, 16)
    }
}

