//
//  LazyPaginable.swift
//  Iffirmations
//
//  Created by Fares Cherni on 24/02/2023.
//

import SwiftUI

struct ContentView3: View {
    
    let images = (1...90).map { "ThemeBg\($0)" } // create an array of image names
    
    var body: some View {
        
        TabView {
            
            ForEach(images.indices, id: \.self) { index in
                // create a view for each image, using LazyVGrid for efficient rendering
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                    ForEach(images[index..<min(index+20, images.count)], id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                    }
                }
            }
            
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
    }
}
