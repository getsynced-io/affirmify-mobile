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
    var body: some View {
        VStack(spacing: 0){
            switch tabState {
            case .General:
               GenralView(wQuoteVM: wQuoteVM,themeVM: themeVM)
            case .Categories:
                CategoriesView()
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

