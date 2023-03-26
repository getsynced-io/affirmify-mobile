//
//  WidgetsScreen.swift
//  Iffirmations
//
//  Created by Fares Cherni on 08/03/2023.
//

import SwiftUI
import WidgetKit

struct WidgetsScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("widgetQuantity",store: store) var widgetQuantity: Int = 10
    @AppStorage("WidgetCategory",store: store) var category: String = ""
    @AppStorage("sharedQuotes",store: store) var sharedQuotes  : [ WQuoteFavorite] = []
    let stateUndoManager : StateUndoManager<String>
    var body: some View {
        ZStack{
            Color._000000.ignoresSafeArea()
            VStack(spacing: 0) {
                SettingsHeaderView(title: "Widgets", cancelHandler: {
                    
                    withAnimation {
                        stateUndoManager.undo()
                        category = stateUndoManager.currentState
                        presentationMode.wrappedValue.dismiss()
                    }
                })
                .padding(.bottom , 32)
                
                Text("Customize multiple widgets to fit your home screen")
                    .customFont(font: .InterMedium, size: 24, color: ._FFFFFF)
                    .multilineTextAlignment(.center)
                    .padding(.bottom , 16)
                    .padding(.horizontal, 16)
                
                
                Spacer(minLength: 0)
                
                Quantity
                    .frame(height: 24)
                    .padding(.horizontal, 16)
                    .padding(.bottom , 16)
                seperator
                
                
                categorySelection
                
                GreenButtonView(buttonTitle: "Save") {
                    DispatchQueue.main.async {
                        sharedQuotes = WQuoteViewModel.shared.sharedQuotesComputedValue
                        WidgetCenter.shared.reloadAllTimelines()
                    }
                    presentationMode.wrappedValue.dismiss()
                    
                }
                .padding(.horizontal, 16)
                .padding(.vertical , 16)
                .padding(.bottom , 16)
            }
            .background(Color._000000.ignoresSafeArea())
        }
       
    }
    
    
    var Quantity : some View {
        HStack(spacing: 0){
            Text("Quantity Per Day")
                .customFont(font: .InterMedium, size: 16 , color: ._FFFFFF)
            Spacer(minLength: 0)
            
            HStack(spacing: 8) {
                IncrementalButton(operation: .minus, counter: $widgetQuantity, counterLimit: 0)
                Text("\(widgetQuantity)x")
                    .customFont(font: .InterMedium, size: 16 , color: ._FFFFFF)
                    .frame(width: 32)
                IncrementalButton(operation: .plus, counter: $widgetQuantity, counterLimit: 24)
            }
        }
    }
    
    
    var categorySelection : some View {
        HStack(spacing: 0){
           Text("Type of Quotes")
                .customFont(font: .InterMedium, size: 16, color: ._FFFFFF)
            
            Spacer(minLength: 0)
            NavigationLink {
                TypeOfQuotesScreen(category: $category)
                    .background(
                        Color._F6F5EC.ignoresSafeArea()
                    )
                    .navigationTitle("")
                    .navigationBarHidden(true)
            } label: {
                HStack(spacing: 16){
                    Text(category.isEmpty ? "General" : "\(category)")
                        .customFont(font: .InterMedium, size: 16, color: ._FFFFFF)
                    Image("chevron-right")
                        .frame(width: 24,height: 24)
                }
            }

        
        }
        .padding( 16)
        
    }
    
}






struct TypeOfQuotesScreen: View , SettingsViewProtocol {
    @Environment(\.presentationMode) var presentationMode
    @Binding  var category : String
    var body: some View {
        ZStack{
            Color._000000.ignoresSafeArea()
            VStack(spacing: 0) {
                SettingsHeaderView(title: "Type of Quotes", cancelHandler: {
                    withAnimation {
                        presentationMode.wrappedValue.dismiss()
                    }
                })
                .padding(.bottom , 32)
                
                Text("Add a custom phrase Siri can use to tell Quottie to run this shortcut")
                    .customFont(font: .InterMedium, size: 24, color: ._000000)
                    .multilineTextAlignment(.center)
                    .padding(.bottom , 16)
                    .padding(.horizontal, 16)
                scrollableSelection
                    .padding(.bottom , 16)
                
                
            }
            .background(Color._000000.ignoresSafeArea())
        }
    }
    
    var scrollableSelection :some View {
        ScrollView(.vertical , showsIndicators: false) {
            LazyVStack(spacing: 0) {
                
                listRowLocker(title: "Genaral",isLocked: false ) {
                    withAnimation {
                        category = ""
                        presentationMode.wrappedValue.dismiss()
                    }
                                  
                }
                seperator
                
                ForEach(CategoryViewModel.shared.categories , id: \.title){item in
                    
                    
               
                    listRowLocker(title: "\(item.title.rawValue)",isLocked: (item.isPremium && !StoreViewModel.shared.subscriptionActive)  ) {
                        withAnimation {
                            category = item.title.rawValue
                            presentationMode.wrappedValue.dismiss()
                        }
                                      
                    }
                    if CategoryViewModel.shared.categories.last?.title != item.title {
                        seperator
                    }
                    
                }
                
            }
            
        }
    }
    
}
