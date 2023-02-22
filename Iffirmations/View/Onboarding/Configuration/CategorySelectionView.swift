//
//  CategorySelectionView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 22/02/2023.
//

import SwiftUI

struct CategorySelectionView: View {
    @StateObject var categoryVM : CategoryViewModel = CategoryViewModel()
    @Environment(\.presentationMode) var presentation
    @State var nextViewIsActive : Bool = false
    var body: some View {
        VStack(spacing: 0){
            
            backButtom
                .padding(.bottom , 32)
            
            Text("Develop a higher level of self-esteem and positivity")
                .customFont(font: .IBMPlexSerifMedium, size: 24, color: Color._000000)
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 0)
            
            Text("Choose up to 10 categories")
                .customFont(font: .IBMPlexSerifRegular, size: 16, color: Color._000000)
                .multilineTextAlignment(.center)
                .padding(.bottom,32)
            
            
            CustomGridView(categories:$categoryVM.categories )
            
    
            
            GreenButtonView(buttonTitle: "Next") {
                
            }
            .padding(.vertical,32)
            
        }
        .padding(.horizontal , 16)
        .background(Color._F6F5EC)
    }
    
    var backButtom : some View{
        
        HStack(spacing: 0){
            Button {
                self.presentation.wrappedValue.dismiss()
            } label: {
                Image("arrow-left")
                    .frame(width: 24,height: 24)
            }

            Spacer(minLength: 0)
        }
        .frame(height: 44)
    }
}

