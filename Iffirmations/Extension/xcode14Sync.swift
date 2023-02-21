//
//  xcode14Sync.swift
//  scanZi
//
//  Created by Fares Cherni on 18/09/2022.
//

import Foundation
import SwiftUI
extension View{
func sync<T:Equatable>(_ published:Binding<T>, with binding:Binding<T>)-> some View{
    self
        .onChange(of: published.wrappedValue) { published in
            withAnimation {
                binding.wrappedValue = published
            }
        }
        .onChange(of: binding.wrappedValue) { binding in
            withAnimation {
                published.wrappedValue = binding
            }
        }
}
}



