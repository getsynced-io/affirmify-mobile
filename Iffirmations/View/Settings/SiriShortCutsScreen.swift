//
//  SiriShortCutsScreen.swift
//  Iffirmations
//
//  Created by Fares Cherni on 07/03/2023.
//

import SwiftUI
import Intents
import IntentsUI


struct SiriShortCutsScreen: View , SettingsViewProtocol {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var siriVM : SiriContentViewModel = SiriContentViewModel()
    var body: some View {
        
        ZStack{
            Color._000000.ignoresSafeArea()
            VStack(spacing: 0) {
                SettingsHeaderView(title: "Siri Shortcuts", cancelHandler: {
                    withAnimation {
                        presentationMode.wrappedValue.dismiss()
                    }
                })
                .padding(.bottom , 32)
                
                Text("Add a custom phrase Siri can use to tell Quottie to run this shortcut")
                    .customFont(font: .InterMedium, size: 24, color: ._FFFFFF)
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
                ForEach(CategoryViewModel.shared.categories , id: \.title){item in
                    
                    listRowLocker(title: "\(item.title.rawValue)",isLocked: (item.isPremium && !StoreViewModel.shared.subscriptionActive)  ) {
            
                      
                        let activity = NSUserActivity(activityType: "com.Quottie.Quotes.viewquotes")
                        activity.title = "Quottie Show \(item.title.rawValue) quotes"
                        activity.isEligibleForSearch = true
                        activity.isEligibleForPrediction = true
                        activity.suggestedInvocationPhrase = "Quottie \(item.title.rawValue) quotes"
                        activity.userInfo = ["category" : (item.title.rawValue)]
               
                        activity.becomeCurrent()
                        
                        let shortcut = INShortcut(userActivity: activity)
                        let viewController = INUIAddVoiceShortcutViewController(shortcut: shortcut)
                        viewController.delegate = siriVM
                        viewController.modalPresentationStyle = .formSheet
                        UIApplication.shared.windows.first?.rootViewController?.present(viewController, animated: true, completion: nil)
                        
                                      
                    }
                    
                    if CategoryViewModel.shared.categories.last?.title != item.title {
                        seperator
                    }
                   
                    
                }
                
            }
            
        }
    }
    
}

class SiriContentViewModel: NSObject,INUIAddVoiceShortcutViewControllerDelegate , ObservableObject {
    func addVoiceShortcutViewController(_ controller: INUIAddVoiceShortcutViewController, didFinishWith voiceShortcut: INVoiceShortcut?, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func addVoiceShortcutViewControllerDidCancel(_ controller: INUIAddVoiceShortcutViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}


