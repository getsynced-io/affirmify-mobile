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
            Color._000000.ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            VStack(spacing: 0){
                Image("iffirmations")
                    .frame(width: 48, height: 48)
                    .offset(y: imageYOffset)
                    .scaleEffect(imageScale)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color._000000.ignoresSafeArea()
                .frame(maxWidth: .infinity, maxHeight: .infinity))
         
        }
        .withHostingWindow { window in
                   window?.rootViewController?.view.backgroundColor = UIColor.black
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



extension View {
    func withHostingWindow(_ callback: @escaping (UIWindow?) -> Void) -> some View {
        self.background(HostingWindowFinder(callback: callback))
    }
}

struct HostingWindowFinder: UIViewRepresentable {
    var callback: (UIWindow?) -> ()

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async { [weak view] in
            self.callback(view?.window)
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }
}
