//
//  ViewExtension.swift
//  Iffirmations
//
//  Created by Fares Cherni on 07/03/2023.
//

import SwiftUI

extension View {
    var seperator : some View {
    Rectangle()
            .frame(width: UIScreen.main.bounds.width,height: 1)
            .foregroundColor(Color._000000.opacity(0.16))
    }
}
