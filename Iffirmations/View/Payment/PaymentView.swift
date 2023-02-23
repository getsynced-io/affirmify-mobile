//
//  PaymentView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 23/02/2023.
//

import SwiftUI
import RevenueCat
struct PaymentView: View {
    @Binding var isPresented : Bool
    @State  var showDismissButton : Bool = false
    var annually : Package? {
       StoreViewModel.shared.offerings?.current?.availablePackages.first(where: { package in
            package.storeProduct.productIdentifier == Constants.annualProductID
       })
    }
    fileprivate
    var descriptions : [String] {["Fully customizable themes","World's most powerful quotes","No ads, no watermarks","Only \(price(.Monthly)) US$/month, billed annually","Cancel anytime!"]}

    
    var body: some View {
        VStack(spacing:0){
            exitButton
                .padding(.bottom ,32)
            Text("🎨")
                .font(.system(size: 96))
                .padding(.horizontal , 16)
                .padding(.bottom,32)
            Text("Unlock Everything!")
                .customFont(font: .IBMPlexSerifMedium, size: 24, color: ._000000)
                .padding(.horizontal , 16)
                .padding(.bottom,32)
            
            description
                .padding(.horizontal , 16)
            
            Spacer(minLength: 0)
        }
       
        .background(Color._F6F5EC.ignoresSafeArea())
    }
    
    var exitButton : some View {
        
        HStack(spacing: 0) {
            Spacer(minLength: 0)
            if showDismissButton {
                Button {
                    withAnimation {
                        isPresented = false
                    }
                } label: {
                    Image("circle-x")
                        .frame(width: 24,height: 24)
                }
            }

        }
        .frame(height: 44)
        .padding(.horizontal,16)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                withAnimation {
                    showDismissButton = true
                }
            }
        }
    }
    
    
    var description : some View {
        HStack(spacing:0){
            Spacer(minLength: 0)
            VStack(alignment : .leading,spacing: 16) {
                ForEach(descriptions, id: \.self) { item in
                    PymentDescriptionRowView(description: item)
                        .frame( height: 24)
                }
                
            }
            Spacer(minLength: 0)
        }
        
    }
    
    var promotionLabel  : some View {
            Text("\(price(.Annually,ex: true))/year \(price(.Annually))/year")
                .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                .strikethrough()
    }
    
    
    enum PricePeriod{
        case Annually , Monthly
    }
    func price(_ pr : PricePeriod,ex: Bool = false)-> String{
        let price = annually?.storeProduct.price ?? 114.99 + (ex ?  5.0 : 0.0)  // remider to revert it back to 14.99
        switch pr {
        case .Annually : return "\(price.Decimal2Digit()) US$"
        case .Monthly : return "\((price / 12.0).Decimal2Digit()) US$"
        }
    }
    
}


fileprivate
struct PymentDescriptionRowView: View {
    let description : String
    var body: some View {
        HStack(spacing: 16){
            Image("circle-check")
                .frame(width: 24, height: 24)
                .clipped()
            Text(description)
                .customFont(font: .IBMPlexSerifMedium, size: 16 , color: ._000000)
            
            
        }
    }
}



