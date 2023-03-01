//
//  GeneralSettingsView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 01/03/2023.
//

import SwiftUI

struct GeneralSettingsView: View {
    @AppStorage("favorite") var favoriteQuotes  : [ WQuoteFavorite] = []
    @Binding var isPresented : Bool
    @ObservedObject var wQuoteVM : WQuoteViewModel
    @State var favoriteQuotesIsPresented : Bool = false
    var seperator : some View {
    Rectangle()
            .frame(width: UIScreen.main.bounds.width,height: 1)
            .foregroundColor(Color._000000.opacity(0.16))
            .clipped()
    }
    var body: some View {
        VStack(spacing: 0){
            nextView
            
            headerView
                .padding(.bottom , 16)
            Group{
                listRow(title: "Favorites (\(favoriteQuotes.count))") {
                    withAnimation {
                        favoriteQuotesIsPresented = true
                    }
                }
                seperator
                
                listRow(title: "Settings") {
                    
                }
                seperator
            }
            Group{
                listRow(title: "Share App") {
                    
                }
                seperator
                
                listRow(title: "Rate Us") {
                    
                }
                seperator
            }
                
                listRow(title: "Restore") {
                    
                }
                seperator
                
            Group{
                listRow(title: "Contact") {
                    
                }
                seperator
                
                listRow(title: "Legal") {
                    
                }
                seperator
            }
                
                listRow(title: "Social Media") {
                    
                }
         
            HStack(spacing: 0) {
                Text("v1.0")
                    .customFont(font: .IBMPlexSerifRegular, size: 12,lineHeight: 16 , color: ._000000.opacity(0.64))
                    .padding(16)
                Spacer(minLength: 0)
            }
            
            
            Spacer(minLength: 0)
            
           
      
            
        }

    }
    
    var nextView : some View {
        CustomNavigationLink(isActive: $favoriteQuotesIsPresented) {
        FavoriteScreen(wQuoteVM: wQuoteVM, isPresented: $favoriteQuotesIsPresented)
                .background(
                    Color._F6F5EC.ignoresSafeArea()
                )
        }
    }
    
    func listRow(title : String,action :@escaping ()->()) ->  some View {
        Button {
            action()
        } label: {
            HStack(spacing: 0){
               Text(title)
                    .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                    .frame(height: 24)
                Spacer(minLength: 0)
                Image("chevron-right")
                    .frame(width: 24,height: 24)
                
            }
        }
        .padding(16)
        .frame(height: 56)
    }

    
    var headerView :some View {
        ZStack {
            HStack(spacing: 0){
                Button {
                    isPresented = false
                } label: {
                    Image("arrow-left")
                        .frame(width: 24,height: 24)
                }
                
                Spacer(minLength: 0)
            }
            
            Text("Settings")
                .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                .frame(height: 24)
        }
        .frame(height: 44)
        .padding(.horizontal, 16)
        
     
    }
}

