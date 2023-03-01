//
//  HomeView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 25/02/2023.
//

import SwiftUI

enum TabState : String {
    case General , Categories ,  Themes
}

struct HomeView: View {
    @State var tabState  : TabState = .General
    @ObservedObject var wQuoteVM : WQuoteViewModel
    @StateObject var themeVM : ThemeViewModel = ThemeViewModel()
    @AppStorage("FirstTime") var firstTime : Bool  = true
    @State var settingsIsPresented: Bool = false
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0){
                    nextView
                    
                    switch tabState {
                    case .General:
                        GenralView(wQuoteVM: wQuoteVM,themeVM: themeVM,settingsIsPresented: $settingsIsPresented)
                    case .Categories:
                        CategoriesView(tabState: $tabState)
                    case .Themes:
                        ThemesView(themeVM: themeVM)
                    }
                    
                    BottomSelectionView
                        .zIndex(999)
                }
                .ignoresSafeArea(.keyboard , edges: .bottom)
                .background(
                    Color._F6F5EC.ignoresSafeArea()
                )
                if firstTime {
                    Color._000000.opacity(0.32).ignoresSafeArea()
                    firstTimeNotation
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
        .navigationViewStyle(.stack)
   
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
            Image("👆")
                .resizable()
                .scaledToFit()
                .frame(width: 96,height: 96)
            Text("Swipe left or right to read more quotes")
                .customFont(font: .IBMPlexSerifMedium, size: 24, color: ._000000)
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
        .background(Color._FFFFFF)
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
                .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                .frame(height: 24)
            
            if type == tabState {
                Circle()
                    .frame(width: 8,height: 8)
                    .foregroundColor(._000000)
            }
            Spacer(minLength: 0)
        }
        .frame(width: UIScreen.main.bounds.width / 3.0,height: 48)
        .onTapGesture {
            tabState = type
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

