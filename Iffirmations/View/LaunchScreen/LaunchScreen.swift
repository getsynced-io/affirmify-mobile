//
//  LaunchScreen.swift
//  Iffirmations
//
//  Created by Fares Cherni on 09/03/2023.
//

import SwiftUI

struct LaunchScreen: View {
    @State var imageYOffset =  UIScreen.main.bounds.size.height
    @State var imageScale = 0.6
    var body: some View {
        ZStack{
            Color._F6F5EC
                .ignoresSafeArea()
            
            Image("iffirmations")
                .resizable()
                .scaledToFit()
                .frame(width: 64, height: 64)
                .offset(y: imageYOffset)
                .scaleEffect(imageScale)
        }
        .onAppear {
            withAnimation {
                imageYOffset = 0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35){
                withAnimation {
                    imageScale  = 1
                }
            }
        }
    }
}
