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
         return   package.storeProduct.productIdentifier == Constants.annualProductID
       })
    }
    fileprivate
    var descriptions : [String] {["Fully customizable themes","World's most powerful quotes","No ads, no watermarks","Only \(price(.Monthly))/month, billed annually","Cancel anytime!"]}
    @State var paymentErrors : PaymentErrorHandler = PaymentErrorHandler()
    @State var paymentBlur : Bool = false
    var body: some View {
        Group{
            if annually != nil {
                mainView
            }
            else {
                ProgressView()
                
            }
        }
        .background(Color._F6F5EC.ignoresSafeArea())
    }
    
    
    
    var mainView :some View {
        VStack(spacing:0){
            exitButton
                .padding(.bottom ,32)
            Image("🎨")
                .resizable()
                .scaledToFit()
                .frame(width: 96,height: 96)
                .padding(.horizontal , 16)
                .padding(.bottom,32)
            Text("Unlock Everything!")
                .customFont(font: .IBMPlexSerifMedium, size: 24, color: ._000000)
                .padding(.horizontal , 16)
                .padding(.bottom,32)
            
            description
                .padding(.horizontal , 16)
            
            Spacer(minLength: 0)
            
            promotionLabel
                .padding(16)
            
            GreenButtonView(buttonTitle: "I’m In!", handler: {
                processPayment()
            })
                .padding(.bottom,16)
            Button {
                restore()
            } label: {
                Text("Already a Member?")
                    .customFont(font: .IBMPlexSerifMedium, size: 12, color: ._000000)
                    .padding(.bottom,32)
            }


        }
        .overlay (
            progressView
        )
        .overlay( EmptyView().alert(isPresented: $paymentErrors.purchaseFailedAlert){Alert(title: Text(PaymentErrorHandler.purchaseFailed.tittle), message: Text(PaymentErrorHandler.purchaseFailed.description), dismissButton: .default(Text("Close")))})
        
        
        .overlay( EmptyView().alert(isPresented: $paymentErrors.restoreFailedAlert){Alert(title: Text(PaymentErrorHandler.restoreFailed.tittle), message: Text(PaymentErrorHandler.restoreFailed.description), dismissButton: .default(Text("Close")))})
        

        
        .overlay( EmptyView().alert(isPresented: $paymentErrors.restoreSuccessfulAlert){Alert(title: Text(PaymentErrorHandler.restoreSuccessful.tittle), message: Text(PaymentErrorHandler.restoreSuccessful.description), dismissButton: .default(Text("OK"),action: {
            withAnimation {
                isPresented = false
            }
        }))})
        
        
        .overlay( EmptyView().alert(isPresented: $paymentErrors.restoreSuccessfulAlertNoSubscription){Alert(title: Text(PaymentErrorHandler.restoreSuccessfulNoSubscription.tittle), message: Text(PaymentErrorHandler.restoreSuccessfulNoSubscription.description), dismissButton: .default(Text("OK"),action: {
        }))})
        
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
        Group {
            Text("\(price(.Annually,ex: true))/year")
                .strikethrough()
            +
            Text(" \(price(.Annually))/year")
        }
        .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
        .frame(height: 24)
      
    
              
               
    }
    
    
    enum PricePeriod{
        case Annually , Monthly
    }
    func price(_ pr : PricePeriod,ex: Bool = false)-> String{
        let price = (annually?.storeProduct.price ?? 114.99) + (ex ?  5.0 : 0.0)  // remider to revert it back to 14.99
        switch pr {
        case .Annually : return "\(price.Decimal2Digit()) \((annually?.storeProduct.currencyCode ?? "USD"))"
        case .Monthly : return "\((price / 12.0).Decimal2Digit()) \((annually?.storeProduct.currencyCode ?? "USD"))"
        }
    }
    
    
    
    func restore(){
        withAnimation {
            paymentBlur = true
        }
        
        Purchases.shared.restorePurchases { customerInfo, error in

            if let _ = error {
                withAnimation {paymentBlur = false};
                withAnimation{paymentErrors.restoreFailedAlert = true}
                
                return}
            
            withAnimation { paymentBlur = false}

            if customerInfo?.entitlements[Constants.entitlementID]?.isActive == true {
                StoreViewModel.shared.subscriptionActive = true
                withAnimation { paymentErrors.restoreSuccessfulAlert = true}
             }
            else {
                withAnimation { paymentErrors.restoreSuccessfulAlertNoSubscription = true}
            }
            
        }

    }
    
    func processPayment(){
        
            if let annually = annually {
                withAnimation {
                    paymentBlur = true
                }
                
                Purchases.shared.purchase(package: annually) { (transaction, customerInfo, error, userCancelled) in
                 
                    
                    if error != nil {
                        withAnimation {paymentBlur = false}
                        withAnimation {paymentErrors.purchaseFailedAlert = true}
                        print("payment error \(error)")
                        return
                    }
                    withAnimation {paymentBlur = false}
                    StoreViewModel.shared.customerInfo = customerInfo
                    if customerInfo?.entitlements[Constants.entitlementID]?.isActive == true {
                        StoreViewModel.shared.subscriptionActive = true
                    //    WQuoteViewModel.shared.updateFiltredQuotes()
                        withAnimation {
                            isPresented = false
                        }
                    }
                    
                }
            }
    }
    
    
    var progressView : some View {
        Group{
            if paymentBlur {
                Color.black.opacity(0.3).ignoresSafeArea()
                ProgressView()
            }
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



