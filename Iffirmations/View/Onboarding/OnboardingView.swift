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
    @State var startAnimation : Bool = false
    @Binding var state  : OnboardingState
    var body: some View {
        VStack(spacing : 0){
           
            DemoViewHeaderView(demoState: $demoState, state: $state)
                    .frame( height: 44)
                   
            
            
            
            DemoInfo(title: titles[demoState.rawValue], demoState: $demoState)
                .padding(.vertical ,32)
                    
            Spacer(minLength: 0)
            

         
            VStack(spacing : 0){
                TabView(selection: $tabDemoState) {
                    ForEach(DemoState.allCases ,id : \.self){ item in
                        DemoImage(imageTitle:  "Ill\(item.rawValue)" )
                            .tag(item)
                            .animation(.easeOut, value: demoState)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .clipped()
            }
            .sync($tabDemoState, with: $demoState)

          
            
            
            Spacer(minLength: 0)
            
            
             
                
            GreenButtonView(buttonTitle:  demoState == .eighth ? "Go to Configuration" :   "Next") {
        
                    if demoState == .eighth
                    {
                        withAnimation {
                            state = .configuration
                        }
                    }
                    else {
                        withAnimation {
                            demoState = demoState.next()
                        }
                    }
                  
                
            }
            .padding(.horizontal, 16)
            .frame( height: 48)
            .padding(.vertical ,32)

            
            
            
        }
        .background(Color._F6F5EC.ignoresSafeArea())
    }
}

fileprivate
struct DemoViewHeaderView: View {
    @Binding var demoState : DemoState
    @Binding  var state  : OnboardingState
    @State var show = false
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
                withAnimation {
                    state = .configuration
                }
            } label: {
                Text("Skip")
                    .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
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
                .customFont(font: .IBMPlexSerifMedium, size: 16, color: ._000000)
                .frame(height: 24)
        VStack(spacing: 0){
        Text(title)
        .customFont(font: .IBMPlexSerifMedium, size: 24, color: ._000000)
        .fixedSize(horizontal: false, vertical: true)
        .lineLimit(3)
        .multilineTextAlignment(.center)
        Spacer(minLength: 0)
        }
        .frame(height: 96)
       
        
        }
        .padding(.horizontal, 16)
}
}


struct GreenButtonView: View {
    let buttonTitle : String
    var width : CGFloat  {UIScreen.main.bounds.width - 32}
    let handler : ()->()
    var body: some View {
        Button {
            handler()
        } label: {
            ZStack {
                Color._3FBA73.frame(width: width, height: 48)
                    .cornerRadius(24)
                Text(buttonTitle)
                    .customFont(font: .IBMPlexSerifMedium, size: 16, color: Color._F6F5EC)
            }
        }
        .buttonStyle(.plain)
    }
}


