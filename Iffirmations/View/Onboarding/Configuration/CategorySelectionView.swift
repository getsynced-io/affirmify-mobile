//
//  CategorySelectionView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 22/02/2023.
//

import SwiftUI
import FacebookCore

struct CategorySelectionView: View {
    @StateObject var categoryVM : CategoryViewModel = CategoryViewModel.shared
    @Environment(\.presentationMode) var presentation
    @State var nextViewIsActive : Bool = false
    var selectedCategoriesCount : Int {
        categoryVM.categories.filter { ca in
            ca.isSelected
        }
        .count
    }
    var calledFromConfiguration : Bool = false
    @AppStorage("AppState",store: store) var state  : OnboardingState = .demo
    var body: some View {
        ZStack{
            Color._000000.ignoresSafeArea()
            VStack(spacing: 0){
                SettingsHeaderView(title: calledFromConfiguration ? "Personal Preferences" : "", cancelHandler: {
                    self.presentation.wrappedValue.dismiss()
                })
                .padding(.bottom , 32)
                Text("Develop a higher level of self-esteem and positivity")
                    .customFont(font: .InterMedium, size: 24, color: Color._FFFFFF)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal , 16)
                Spacer(minLength: 0)
                
                Text("Choose up to 10 categories")
                    .customFont(font: .InterMedium, size: 16, color: Color._FFFFFF)
                    .multilineTextAlignment(.center)
                    .padding(.bottom,16)
                    .padding(.horizontal , 16)
                
                CustomGridView(categories:$categoryVM.categories )
                
                Group{
                    if selectedCategoriesCount != 0 {
                        GreenButtonView(buttonTitle:calledFromConfiguration ? "Save" :  "Next(\(selectedCategoriesCount))") {
                            for category in categoryVM.categories {
                                if category.isSelected {
                                    AppEvents.shared.logEvent(AppEvents.Name("\(category.title.rawValue)"))
                                }
                            }
                            
                            if calledFromConfiguration {
                                presentation.wrappedValue.dismiss()
                            }
                            else {
                                withAnimation {
                                    StoreViewModel.shared.showPaymentView  = true
                                }
                            }
                            
                        }
                    }
                    else{
                        Text("")
                    }
                }
                .frame(height: 48)
                .padding(.horizontal , 16)
                .padding(.bottom, 32)
                .padding(.top,16)
            }
            .background(Color._F6F5EC.ignoresSafeArea())
        }
    }
    
}

