//
//  OnboardingView.swift
//  Iffirmations
//
//  Created by Fares Cherni on 20/02/2023.
//

import SwiftUI

enum DemoState : Int, Hashable, CaseIterable {
    case first , second , third , fourth ,fifth , sixth ,seventh ,eighth
}


let titles : [String]  = [
    "Unleash the power of widgets on your phone",
    "Adjust your daily notifications to meet your needs",
    "Search for quotes with the flick of a finger",
    "Cozy categories always correspond to your mood",
    "Tired of simplicity? We have a lot of themes",
    "Simpliy redesign and create your own templates",
    "Find a shortcut you want to add a voice trigger to",
    "Create a custom notification layout settings"

]

struct DemoView: View {
    @State var demoState : DemoState = .first
    @State var tabDemoState : DemoState = .first
    @State var pushNextView : Bool = false
   // @AppStorage("AppState",store: store) var state  : OnboardingState = .demo
    var body: some View {
        NavigationView{
        VStack(spacing : 0){
            nextView
            
            DemoViewHeaderView(demoState: $demoState,pushNextView: $pushNextView)
                    .frame( height: 44)
                   // .background(Color.green)
            DemoInfo(title: titles[demoState.rawValue], demoState: $demoState)
                .padding(.vertical ,32)
               // .background(Color.blue)
            VStack(spacing : 0){
                TabView(selection: $tabDemoState) {
                    ForEach(DemoState.allCases ,id : \.self){ item in
                        Image("Ill\(item.rawValue)" )
                            .resizable()
                            .scaledToFit()
                            .frame(width:  UIScreen.main.bounds.width - 64)
                            .tag(item)
                            .animation(.easeOut, value: demoState)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .clipped()
            }
            .sync($tabDemoState, with: $demoState)
            
            Group{
                
                if tabDemoState == .eighth {
                        ZStack {
                            Color._3FBA73.frame(width: UIScreen.main.bounds.width - 32 , height: 48)
                                .cornerRadius(24)
                            Text("Go to Configuration")
                                .customFont(font: .IBMPlexSerifMedium, size: 16, color: Color._F6F5EC)
                        }
                        .animation(nil)
                        .transition(.identity)
                        .onTapGesture {
                            pushNextView = true
                        }
                }
           else {
                    GreenButtonView(buttonTitle: "Next") {
                        withAnimation {
                            demoState = demoState.next()
                        }
                    }
                    .transaction { transaction in
                        transaction.animation = nil
                    }
                    .animation(nil)
                    
                }
            }
            .padding(.horizontal, 16)
            .frame( height: 48)
            .padding(.vertical ,32)

        }
        .background(Color._F6F5EC.ignoresSafeArea())
        .navigationTitle("")
        .navigationBarHidden(true)
        
      }
    }
    
    
    var nextView : some View {
        CustomNavigationLink(isActive: $pushNextView) {
            NotificationTimeView()
                .background(Color._000000.ignoresSafeArea())
        }
    }
}

fileprivate
struct DemoViewHeaderView: View {
    @Binding var demoState : DemoState
    @Binding var pushNextView : Bool
    @State var show = false
   
//    @AppStorage("AppState",store: store) var state  : OnboardingState = .demo
    var body: some View {
        ZStack{
        HStack(spacing : 0){
            Button {
                withAnimation() {
                    switch demoState {
                    case .first:
                        break
                    default :
                        demoState = demoState.previous()
                    }
                }
            } label: {
                Image("arrow-left")
                    .frame(width: 32,height: 32)
                    .contentShape(Rectangle())
            }
            .frame(width: 24, height: 24)
            .opacity(demoState == .first ? 0 : 1)
            .buttonStyle(.plain)
        
      
            
            Spacer()
            Button {
                   // state = .configuration
                pushNextView = true
            } label: {
                Text("Skip")
                    .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._FFFFFF)
                    .opacity(demoState == .eighth ? 0 : 1)
                
            }
            .frame( height: 44)
            .clipped()
            
        }
        .padding(.horizontal , 16)
        .frame( height: 44)
            
            HStack(spacing: 16){
             
                ForEach(DemoState.allCases ,id : \.self){ item in
                    IndexDotView(demoState: $demoState,state: item)
                }
                
            }
            .frame( height: 44)
            .clipped()
        }
        
    }
}


struct IndexDotView: View {
    @Binding var demoState : DemoState
    let state : DemoState
    var body: some View {
        Group{
            
            Capsule()
                .frame(width:demoState == state ? 32 :  8,height: 8)
                .foregroundColor(demoState == state ? ._3FBA73 :   ._3FBA73.opacity(0.16))
        }
       
      
    }
    
 }



struct DemoImage: View {
    let imageTitle :  String

    var body: some View {
            Image(imageTitle)
                .resizable()
                .scaledToFit()
                .frame(width:  UIScreen.main.bounds.width - 64)
    }
}




struct DemoInfo: View {
    let title : String
    var height : CGFloat  {96}
    var width : CGFloat  {UIScreen.main.bounds.width - 32}
    @Binding var demoState : DemoState
    var body: some View {
        VStack(spacing: 32){
        Text("\(demoState.rawValue + 1) of \(DemoState.allCases.count)")
                .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._FFFFFF)
                .frame(height: 24)
            VStack(spacing: 0){
        Text(title)
        .customFont(font: .IBMPlexSerifMedium, size: 24, color: ._FFFFFF)
        .animation(nil)
        .lineLimit(3)
        .multilineTextAlignment(.center)
        }
        }
        .frame(width: UIScreen.main.bounds.width - 32)
        .padding(.horizontal, 16)
}
}


struct GreenButtonView: View {
    let buttonTitle : String
    var width : CGFloat  = UIScreen.main.bounds.width - 32 
    let handler : ()->()
    var body: some View {
        Button {
            handler()
        } label: {
            ZStack {
                Color._3FBA73.frame(width: width, height: 48)
                    .cornerRadius(8)
                Text(buttonTitle)
                    .customFont(font: .IBMPlexSerifMedium, size: 16, color: Color._F6F5EC)
            }
        }
        .buttonStyle(.plain)
    }
}


