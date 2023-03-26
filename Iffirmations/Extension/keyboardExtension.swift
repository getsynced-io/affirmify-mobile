//
//  keyboardExtension.swift
//  scanZi
//
//  Created by Fares Cherni on 12/08/2022.
//

import Foundation
import SwiftUI
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif


/// Publisher to read keyboard changes.
