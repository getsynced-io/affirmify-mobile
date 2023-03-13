//
//  ContentView.swift
//  WatchOSIffirmation Watch App
//
//  Created by Fares Cherni on 09/03/2023.
//

import SwiftUI

struct ContentView: View,ListRowExtension {
    
    @StateObject var wQuoteVM : WQuoteVMWHO = WQuoteVMWHO.shared
    @State var viewToPush : AnyView = AnyView(EmptyView())
    @State var pushView  : Bool  = false
    var body: some View {
       NavigationView{
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack(spacing: 8) {
              
                    tabSelectionView(type: "Favorites") {
                        withAnimation {
                            viewToPush = AnyView(FavoriteQuotesView())
                            pushView = true
                        }
                    }
                    
                    tabSelectionView(type: "Categories") {
                        withAnimation {
                            viewToPush = AnyView(CategoriesView(wQuoteVM : wQuoteVM))
                            pushView = true
                        }
                    }
                }
                
                nextView.buttonStyle(.plain)
                
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
       .navigationViewStyle(.stack)
    }
    
    var nextView : some View {
        Group {
            NavigationLink(isActive: $pushView) {
                viewToPush
                    .background(
                        Color("000000").ignoresSafeArea()
                    )
                 //   .navigationTitle(Text("Back"))
            } label: {

            }

            
        }
        
    }
    

    
}


protocol ListRowExtension {
    
}

extension ListRowExtension {
    func  tabSelectionView(type : String , handler  : @escaping ()->() )->  some View {
        Button {
            handler()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: WKInterfaceDevice.current().screenBounds.width - 16,height: 40)
                    .foregroundColor(Color("222222"))
                
                Text(type)
                    .customFont(font: .InterMedium, size: 16, color: Color("FFFFFF"))
                    .frame(height: 24)
                
            }
        }
        .frame(height: 40)
        .padding(.horizontal,8)
        .buttonStyle(.plain)
        
    }
}
