//
//  ThemesView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 28/02/2023.
//

import SwiftUI
import WidgetKit
import FacebookCore

struct ThemesView: View {
    let columns = [
          GridItem(.flexible(), spacing: 16),
          GridItem(.flexible(), spacing: 16)
      ]
    var columnWidth : CGFloat {
        ((UIScreen.main.bounds.width  - 48) / 2.0)
    }
    
    @Binding  var adsPopUpView : AnyView
    @Binding var adsPopUpIsPresented : Bool
    @State var showPaymentView : Bool = false
    @State var showAddThemeView : Bool = false
    @State var showEditThemeView : Bool = false
    var selectedTheme : ThemeModel{
        ThemeViewModel.shared.themes.first { theme in
            theme.id == ThemeViewModel.shared.ThemeiD
        } ??   ThemeViewModel.shared.themes[0]
    }
    var body: some View {
        VStack(spacing: 0) {
            nextView
            
            headerView
                .padding(.bottom,16)
            
            ZStack(alignment: .bottomTrailing){
                ScrollView{
                    VStack(spacing:0){
                        themesMenue
                            .padding(.bottom,32)
                    }
                }
                Button {
                   addThemeAction()
                } label: {
                    Image("CTA")
                        .frame(width: 48,height: 48)
                        .padding(16)
                }


            }
        }
        .fullScreenCover(isPresented: $showPaymentView) {
            PaymentView(isPresented: $showPaymentView)
        }
    }
    
    var themesMenue : some View {
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(ThemeViewModel.shared.themes, id: \.id) { theme in
                Button {
                    withAnimation {
                        themeAction(theme.id)
                    }
                } label: {
                    themeCard(theme)
                }
                    .padding(.top,16)
            }
        }
        .padding(.horizontal , 16 )
    }
    
    
    func themeAction(_ id: String){
                adsAction {
                    ThemeViewModel.shared.ThemeiD = id
                    DispatchQueue.main.async {
                        print("update widgetKit \(ThemeViewModel.shared.ThemeiD)")
                        ThemeViewModel.shared.themes[0] =  ThemeViewModel.shared.themes[0]
                        WidgetCenter.shared.reloadAllTimelines()
                    }
                    let theme =  ThemeViewModel.shared.themes.first { theme in
                        theme.id == id
                    }
                    if let theme = theme {
                        AppEvents.shared.logEvent(AppEvents.Name("\(theme.fontName)"))
                    }
                   
                }
    }
    func addThemeAction(){
        adsAction {
            showAddThemeView = true
        }
    }
    func editThemeAction(){
        adsAction {
            showEditThemeView = true
        }
    }
    
    
    
    func adsAction(action :@escaping ()->()){
        if StoreViewModel.shared.subscriptionActive {
            withAnimation {
                action()
            }
        }
        else {
            AdHub.shared.callSource = .theme
            if SharedCouter.shared.ThemeAddCounter  == 3 {
                adsPopUpView = AnyView(GoPremiumPopUpView(emoji: "❤️‍🔥", description: "Unlock access to all the features", mainButtonTitle: "Go Premium!", secondButtonTitle: "Watch an Ad",isPresented: $adsPopUpIsPresented, handler: {
                    withAnimation {
                        showPaymentView = true
                        adsPopUpIsPresented = false
                    }
                }, secondHandler: {
                    AdHub.shared.requestAd {
                        withAnimation {
                            action()
                            adsPopUpIsPresented = false
                        }
                    }
                    dismissHandler : {
                        withAnimation {
                            adsPopUpIsPresented = false
                        }
                    }
                }))
                
                adsPopUpIsPresented = true
            }
            else{
                AdHub.shared.requestAd {
                    withAnimation {
                        action()
                    }
                }
            }
        }
    }
    
    
    func resetPopUp(action :@escaping ()->()){
        adsPopUpView = AnyView(GoPremiumPopUpView(emoji: "👨‍🎨", description: "Do you want to reset all themes?", mainButtonTitle: "Yes, Reset All", secondButtonTitle: "No, Cancel",showExitButton: false, isPresented: $adsPopUpIsPresented) {
            withAnimation {
                action()
                adsPopUpIsPresented = false
            }
        } secondHandler: {
            withAnimation {
                adsPopUpIsPresented = false
            }
        })
        withAnimation {
            adsPopUpIsPresented = true
        }

    }
    
    var nextView : some View {
        Group {
            CustomNavigationLink(isActive: $showAddThemeView) {
                ThemeCustomisationMainView()
                    .background(
                        Color._F6F5EC.ignoresSafeArea()
                    )
            }
            CustomNavigationLink(isActive: $showEditThemeView) {
                ThemeCustomisationMainView(selectedTheme: selectedTheme, stateUndoManager: StateUndoManager(initialState: selectedTheme),index: selectedTheme.id)
                    .background(
                        Color._F6F5EC.ignoresSafeArea()
                    )
            }
        }
        
    }

    
    func themeCard( _ theme: ThemeModel)-> some View{
        Group{
            ZStack{
                ZStack(alignment: .topTrailing){
                   
                  if let imageTitle = theme.backgroundImage , let image =  backGroundImage(imageTitle) {
                      image
                            .resizable()
                            .scaledToFill()
                            .frame(width: columnWidth,height: columnWidth)
                            .cornerRadius(16)
                        
                    }
                    else if  let color = theme.backgroundColor {
                        Color(color)
                            .frame(width: columnWidth,height: columnWidth)
                            .cornerRadius(16)
                        
                    }
                    
                    Image(theme.id == ThemeViewModel.shared.ThemeiD ?  "circle-check" : "circle")
                        .frame(width: 24,height: 24)
                        .padding(8)
                    
                }
                Text("Abcd")
                    .customFont(font:FontsExtension(fromRawValue: theme.fontName) , size: 24 , color: Color(theme.fontColor))
            }
        }
    }
    
    
    
    func backGroundImage(_ path : String)-> Image?{
        if path.contains("CustomImage"){
            if let image = LocalFileManager.instance.retrieveImageFromFile(filename: path) {
                return Image(uiImage: image)
            }
            else{
                return nil
            }
        }
        else {
            return Image(path)
        }
        
    }
    var headerView: some View {
        ZStack{
            HStack(spacing: 0){
                Button {
                    
                    resetPopUp {
                        
                        withAnimation {
                            ThemeViewModel.shared.ThemeiD =  "0"
                            ThemeViewModel.shared.themes  =  InitThemes.shared.initialThemes
                            DispatchQueue.main.async {
                                ThemeViewModel.shared.themes[0] =  ThemeViewModel.shared.themes[0]
                                WidgetCenter.shared.reloadAllTimelines()
                            }
                        }
                       
                    }
                } label: {
                    Text("Reset")
                        .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                }
                
                Spacer(minLength: 0)
                Button {
                    withAnimation {
                        editThemeAction()
                    }
                } label: {
                    Text("Edit")
                         .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                }

            }
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
}

