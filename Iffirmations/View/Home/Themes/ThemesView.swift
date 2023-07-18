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
    
    @Binding var tabState  : TabState
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
                        themesMenue
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
    
    let width : CGFloat = (UIScreen.main.bounds.width - 16 * 5) / 3
    var animatedThemes: some View {
        ScrollViewReader { scroller in
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing: 0){
                    
                    ForEach(AnnimatedThemesModel.animatedThemes , id : \.id) { item in
                        
                        HStack(spacing: 0){
                            Button {
                                withAnimation {
                                    animatedThemeAction(item.id)
                                }
                                
                                withAnimation(){
                                    scroller.scrollTo(item.id,anchor:.leading)
                                }
                            } label: {
                                
                                VideoCard(video: item)
                                    .frame(width: width,height: width * 1.77)
                            }
                            .padding(.leading , 16)
                        }
                        .id(item.id)
                        
                        
                    }
                    
                }
                .padding(.trailing, 16 )
            }
            
        }
    }
    
    var themesMenue : some View {
        ScrollView {
            ScrollViewReader { scroller in
            VStack(alignment: .leading ,spacing: 32){
        
                    Text("Animated")
                        .customFont(font: .IBMPlexSerifMedium, size: 24,lineHeight: 32, color: Color._000000)
                        .id("Animated")
                        .padding(.horizontal , 16 )
                    animatedThemes
                
                Text("Regular")
                    .customFont(font: .IBMPlexSerifMedium, size: 24,lineHeight: 32, color: Color._000000)
                    .padding(.horizontal , 16 )
             
                    VStack(spacing:0){
                        LazyVGrid(columns: columns, spacing: 0) {
                            ForEach(ThemeViewModel.shared.themes, id: \.id) { theme in
                                Button {
                                    withAnimation {
                                        themeAction(theme.id)
                                        withAnimation(){
                                            scroller.scrollTo(theme.id,anchor: .top)
                                        }
                                    }
                                } label: {
                                    themeCard(theme)
                                }
                                .padding(.top,16)
                                .id(theme.id)
                                
                            }
                            .onReceive(NotificationCenter.default.publisher(for: NSNotification.scrollToTheme)) { obj in
                                withAnimation(){
                                    if  ThemeViewModel.shared.AnimatedVidID == nil {
                                        scroller.scrollTo("Animated",anchor: .top)
                                    }
                                }
                            }
                            
                        }
                        .padding(.bottom,32)
                    }
                    .padding(.horizontal , 16 )
                }
            }
        }
       
    }
    
    
    func themeAction(_ id: String){
                adsAction {
               
                    DispatchQueue.main.async {
                        ThemeViewModel.shared.AnimatedVidID = nil
                        ThemeViewModel.shared.ThemeiD = id
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
    
    func animatedThemeAction(_ id: String){
        adsAction {
            DispatchQueue.main.async {
                ThemeViewModel.shared.AnimatedVidID = id
                AppEvents.shared.logEvent(AppEvents.Name("Video-\(id)"))
                
                
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
                            .opacity(Double(theme.backgroundOpacity))
                        
                    }
                    else if  let color = theme.backgroundColor {
                        Color(color)
                            .frame(width: columnWidth,height: columnWidth)
                            .cornerRadius(16)
                            .opacity(Double(theme.backgroundOpacity))
                        
                    }
                    
                    Image((theme.id == ThemeViewModel.shared.ThemeiD && ThemeViewModel.shared.AnimatedVidID == nil )  ?  "circle-check" : "circle")
                        .frame(width: 24,height: 24)
                        .padding(8)
                    
                }
                quoteView(theme)
            }
        }
    }
    
    
    func  quoteView(_ theme : ThemeModel ) -> some View {
        
        let textAlignment : SwiftUI.TextAlignment  = {
            switch theme.fontAlignment {
            case .left  : return .leading
            case .middle : return .center
            case .right : return .trailing
            }
        }()
        let textAlignmentPadding : CGFloat =  {
            switch theme.fontAlignment {
            case .left  : return 0
            case .middle : return  16.0
            case .right : return 0
            }
        }()
        let finalQuote : String =  {
            switch theme.textCase {
            case .sentence : return "Abcd"
            case .lowerCase : return "Abcd".lowercased()
            case .upperCase : return "Abcd".uppercased()
            }
            
        }( )
        
       return VStack(spacing: 0){
            Text(finalQuote)
                .customFont(font: FontsExtension(fromRawValue: theme.fontName), size: 24, color: Color(theme.fontColor))
                .padding(.horizontal, textAlignmentPadding)
                .multilineTextAlignment(textAlignment)
                .opacity(theme.fontOpacity)
                .foregroundColor(Color(theme.fontColor))
                .frame(width:  columnWidth - 32,alignment: textAlignment.alinment)
            
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
    @AppStorage("AnimatedVidlSelection") var AnimatedVidID : String?
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
                
                if AnimatedVidID  == nil {
                    Button {
                        withAnimation {
                            editThemeAction()
                        }
                    } label: {
                        Text("Edit")
                            .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                    }
                    .animation(.default,value: AnimatedVidID)
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

