//
//  CategoriesView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 28/02/2023.
//

import SwiftUI
import AppTrackingTransparency
import FacebookCore
struct CategoriesView: View {
    let alphabet = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W", "X","Y", "Z"]
    @StateObject var categoryVM : CategoryViewModel = CategoryViewModel.shared
    @State var searchText : String = ""
    @Binding var tabState  : TabState
    @State var showPaymentView : Bool = false
    let columns : [GridItem] = {
        if   UIDevice.current.userInterfaceIdiom == .pad {
            return [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16),]
        }
        else {
            return [
            GridItem(.flexible(), spacing: 16),
            GridItem(.flexible(), spacing: 16),]
}
    
    }()
    var columnWidth : CGFloat {
        if   UIDevice.current.userInterfaceIdiom == .pad {
          return  ((UIScreen.main.bounds.width  - 80) / 4.0)
        }
        else {
          return  ((UIScreen.main.bounds.width  - 48) / 2.0)
        }
      
    }
    var matchedCategories : [CategoryModel] {
       return  categoryVM.categories.filter { category in
           category.title.rawValue.lowercased().contains(searchText.lowercased())
        }
    }
    @Binding  var adsPopUpView : AnyView
    @Binding var adsPopUpIsPresented : Bool
    @State private var isKeyboardVisible = false
    var body: some View {
        VStack(spacing:0){
            headerView
                .padding(.bottom,16)
            
          
            ScrollView(.vertical){
                VStack(spacing:0){
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
                .padding(.top,16)
            }
            .onTapGesture {
                hideKeyboard()
                isKeyboardVisible = false
            }
        }
        .fullScreenCover(isPresented: $showPaymentView) {
            PaymentView(isPresented: $showPaymentView)
        }
        .onAppear {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized :
                    Settings.shared.isAdvertiserIDCollectionEnabled = true
                    Settings.shared.isAutoLogAppEventsEnabled = true
                    Settings.shared.isAdvertiserTrackingEnabled = true
                    break
                default :
                    Settings.shared.isAdvertiserIDCollectionEnabled = false
                    Settings.shared.isAutoLogAppEventsEnabled = false
                    Settings.shared.isAdvertiserTrackingEnabled = false
                    break
                }
            }
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
    @AppStorage("FeaturedCategory") var savedFeaturedCategory : String = ""
    var featureCategory : some View{
        let featuredCategory : CategoryModel  = categoryVM.categories.first { category in
           let title  =  category.title.rawValue
           return (title == savedFeaturedCategory)
        } ?? categoryVM.categories[0]
 
        return   Group{
            VStack(alignment: .leading , spacing: 32) {
                MenueHeaderLabel("Featured")
         
                if isKeyboardVisible {
                    featuredCardView(featuredCategory)
                        .onTapGesture {
                            hideKeyboard()
                            isKeyboardVisible = false
                        }
                }
                else {
                    Button {
                      categoryAction(category: featuredCategory)
                    } label: {
                        featuredCardView(featuredCategory)
                    }
                }
                
            }
            .padding(.horizontal,16)
        }
    }
    
    
    func featuredCardView( _ featuredCategory: CategoryModel) -> some View {

               ZStack(alignment: .topTrailing){
                   ZStack{
                       Color._EDEBDA
                           .frame(width: UIScreen.main.bounds.width - 32,height: 72)
                           .cornerRadius(16)
                       
                       VStack(spacing: 8){
                           Text(featuredCategory.emoji)
                           
                           Text(featuredCategory.title.rawValue)
                           
                       }
                       .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                       .frame(height: 24)
                       .padding(.vertical , 8)
                   }
                   .frame(width: columnWidth,height: 72)
                   if featuredCategory.isPremium {
                       Image("Lock")
                           .renderingMode(.template)
                           .foregroundColor(._000000)
                           .frame(width: 16 ,height: 16)
                           .padding(8)
                   }
               }
               .frame(width: UIScreen.main.bounds.width - 32,height: 72)

       }
       
    
    func MenueHeaderLabel(_ text : String)->some View {
        
        Text(text)
            .customFont(font: .IBMPlexSerifMedium, size: 24, color: ._000000)
    }
    
    var searchTextField : some View{
        
        ZStack(alignment: .topTrailing){
          
            CustomTextField(placeHolder: "Search...", font: UIFont(name: "IBMPlexSerif-Regular", size: 16)!, text: $searchText,isKeyboardVisible: $isKeyboardVisible)
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
        .frame(width: UIScreen.main.bounds.width - 32,height:  48)
        .padding(.horizontal,16)
        .zIndex(10)
         
    }
    
    var headerView : some View {
        ZStack{
            if !StoreViewModel.shared.subscriptionActive {
                ButtonImage24(title: "crown") {
                    if !StoreViewModel.shared.subscriptionActive {
                        withAnimation {showPaymentView = true}
                        
                    }
                    
                }
                .disabled(StoreViewModel.shared.subscriptionActive )
            }
        }
        .frame(width: UIScreen.main.bounds.width - 32,height: 44)
        
    }
    
    func categoryAction(category : CategoryModel){
        DispatchQueue.main.async {
            
            
            if StoreViewModel.shared.subscriptionActive || !category.isPremium {
                
             
                
                if  CategoryViewModel.shared.selectedID != category.title.rawValue {
                    CategoryViewModel.shared.selectedID = category.title.rawValue
                    WQuoteViewModel.shared.updateFiltredQuotes(categoryId: category.title.rawValue) {
                        tabState = .General
                    }
                }
                else {
                    tabState = .General
                }
            
                
                
                DispatchQueue.global().async {
                    APIManager.shared.incrementCategoryList(categories: [category.title.rawValue]) { result in
                        
                        switch result {
                        case .success(let success):
                            print("result \(success)")
                        case .failure(let failure):
                            print("result \(failure)")
                        }
                        
                        
                    }
                }
                
              
            }
            
            else if category.isPremium {
                withAnimation {showPaymentView = true}
            }
        }
    }
    
    func categoryView(category : CategoryModel) -> some View {

      
                ZStack(alignment: .topTrailing){
                    ZStack{
                        Color._EDEBDA
                            .frame(width: columnWidth,height: 72)
                            .cornerRadius(16)
                        
                        VStack(spacing: 8){
                            Text(category.emoji)
                            
                            Text(category.title.rawValue)
                            
                        }
                        .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                        .frame(height: 24)
                        .padding(.vertical , 8)
                    }
                    .frame(width: columnWidth,height: 72)
                    

                    if category.isPremium && !StoreViewModel.shared.subscriptionActive{
                        Image("Lock")
                            .renderingMode(.template)
                            .foregroundColor(._000000)
                            .frame(width: 16 ,height: 16)
                            .padding(8)
                    }
                    
                }
                   .onTapGesture {
                if isKeyboardVisible {
                   hideKeyboard()
                    isKeyboardVisible = false
                }
                else {
                    categoryAction(category: category)
                }
              
            }
                   .frame(width: columnWidth,height: 72)
                   .padding([.vertical],16)
    }
    
    
    func getCategories(_  c : String)-> [CategoryModel]{
        categoryVM.categories.filter { category in
            String(category.title.rawValue.first!) == c
        }
    }
}
