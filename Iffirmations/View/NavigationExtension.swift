//
//  NavigationExtension.swift
//  Iffirmations
//
//  Created by Fares Cherni on 20/02/2023.
//

import Foundation
import SwiftUI

struct CustomNavigationLink<Content: View>: View {
    let content: Content
    @Binding var isActive : Bool
    init(isActive : Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.content = content()
        self._isActive = isActive
    }
    var body: some View {
        NavigationLink(isActive: $isActive){if isActive{content .navigationTitle("").navigationBarHidden(true)}}label: {}
    }
}

