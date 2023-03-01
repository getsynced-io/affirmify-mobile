//
//  CategoriesView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 28/02/2023.
//

import SwiftUI

struct CategoriesView: View {
    let alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W", "X","Y", "Z"]
    @StateObject var categoryVM : CategoryViewModel = CategoryViewModel()
    @State var searchText : String = ""
    @Binding var tabState  : TabState
    @State var showPaymentView : Bool = false
    let columns = [
          GridItem(.flexible(), spacing: 16),
          GridItem(.flexible(), spacing: 16),
          GridItem(.flexible(), spacing: 16)
      ]
    var columnWidth : CGFloat {
        ((UIScreen.main.bounds.width  - 64) / 3.0)
    }
    var matchedCategories : [CategoryModel] {
       return  categoryVM.categories.filter { category in
           category.title.rawValue.lowercased().contains(searchText.lowercased())
        }
    }
    var body: some View {
        VStack(spacing:0){
            headerView
                .padding(.bottom,32)
            
            ScrollView(.vertical){

            searchTextField
                .padding(.bottom,32)
            
            featureCategory
                .padding(.bottom,32)
            
            categoriesLabel
                .padding(.bottom,32)
            
                Group{
                    if searchText.isEmpty {
                        alphabeticalMenue
                    }
                    else {
                        searchedMenue
                    }
                }
                
            }
        }
        .fullScreenCover(isPresented: $showPaymentView) {
            PaymentView(isPresented: $showPaymentView)
        }
    }
    
    var searchedMenue : some View {
      return   VStack(spacing: 0){
            HStack(spacing: 0) {
                Text("Results(\(matchedCategories.count))")
                    .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                    .padding(.horizontal , 16 )
                
                Spacer(minLength: 0)
            }
            
            LazyVGrid(columns: columns, spacing: 0) {
                ForEach(matchedCategories, id: \.title.rawValue) { category in
                    categoryView(category: category)
                }
            }
            .padding(.horizontal , 16 )
        }
        .padding(.bottom ,16)
    }
    
    var alphabeticalMenue : some View {
      return   ForEach(alphabet , id : \.self) {character in
            if (!getCategories(character).isEmpty){
                VStack(spacing: 0){
                    HStack(spacing: 0) {
                        Text(character)
                            .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                            .padding(.horizontal , 16 )
                        
                        Spacer(minLength: 0)
                    }
                    
                    LazyVGrid(columns: columns, spacing: 0) {
                        ForEach(getCategories(character), id: \.title.rawValue) { category in
                            categoryView(category: category)
                        }
                    }
                    .padding(.horizontal , 16 )
                }
                .padding(.bottom ,16)
            }
        }
    }
    
    var  categoriesLabel : some View {
        HStack(spacing: 0 ){
            MenueHeaderLabel("Categories")
            Spacer(minLength: 0)
        }
        .padding(.horizontal)
      
    }
    
    var featureCategory : some View{
        let featuredCategory : CategoryModel  = categoryVM.categories.randomElement() ??    categoryVM.categories[0]
        return
        Group{
            VStack(alignment: .leading , spacing: 32) {
                MenueHeaderLabel("Featured")
                Button {
                    categoryAction(category: featuredCategory)
                } label: {
                    VStack(spacing: 16) {
                        ZStack(alignment: .topTrailing){
                            Image(featuredCategory.title.rawValue)
                                .resizable()
                                .scaledToFill()
                                .frame(width:  UIScreen.main.bounds.width - 32 ,height: columnWidth)
                                .cornerRadius(16 )
                            
                            if featuredCategory.isPremium {
                                Image("Lock")
                                    .frame(width: 16 ,height: 16)
                                    .padding(8)
                            }
                        }
                        
                        Text(featuredCategory.title.rawValue)
                            .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                    }
                }
                
                
            }
            .padding(.horizontal,16)
        }
    }
    
    func MenueHeaderLabel(_ text : String)->some View {
        Text(text)
            .customFont(font: .IBMPlexSerifMedium, size: 24, color: ._000000)
    }
    
    var searchTextField : some View{
        
        ZStack(alignment: .topTrailing){
          
            CustomTextField(placeHolder: "Search...", font: UIFont(name: "IBMPlexSerif-Regular", size: 16)!, text: $searchText)
                .frame(width: UIScreen.main.bounds.width - 32,height:  48)
                .background(Capsule().frame(height: 48).foregroundColor(Color._EDEBDA))
            if !searchText.isEmpty {
                
                Button {
                    withAnimation {
                        searchText = ""
                    }
                } label: {
                    
                    Image("circle-x")
                        .frame(width: 24,height: 24)
                        .padding(12)
                }
            }
        }
        .padding(.horizontal,16)

         
    }
    
    var headerView : some View {
        ZStack{
            ButtonImage24(title: "crown") {withAnimation {showPaymentView = true}}
        }
        .frame(width: UIScreen.main.bounds.width - 32,height: 44)
        
    }
    
    func categoryAction(category : CategoryModel){
        if StoreViewModel.shared.subscriptionActive || !category.isPremium {
            withAnimation {
                categoryVM.selectedID = category.title.rawValue
            }
            tabState = .General
        }
        else if category.isPremium {
            withAnimation {
                AdHub.shared.callSource = .category
                AdHub.shared.requestAd {
                    withAnimation {
                        categoryVM.selectedID = category.title.rawValue
                    }
                }
            }
        }
    }
    
    func categoryView(category : CategoryModel) -> some View {
        Button {
    
            categoryAction(category: category)
        } label: {
            VStack(spacing: 16){
                ZStack(alignment: .topTrailing){
                    Image(category.title.rawValue)
                        .resizable()
                        .scaledToFill()
                        .frame(width: columnWidth,height: columnWidth)
                        .cornerRadius(16)
                    if category.isPremium {
                        Image("Lock")
                            .frame(width: 16 ,height: 16)
                            .padding(8)
                    }
                    
                }
                Text(category.title.rawValue)
                    .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                    .frame(height: 24)
                
            }
        }
        .frame(width: columnWidth,height: columnWidth + 24 + 16 )
        .padding([.vertical] ,16)
    }
    
    
    func getCategories(_  c : String)-> [CategoryModel]{
        categoryVM.categories.filter { category in
            String(category.title.rawValue.first!) == c
        }
    }
}
