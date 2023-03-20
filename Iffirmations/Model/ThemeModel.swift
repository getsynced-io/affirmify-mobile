//
//  Theme.swift
//  Iffirmations
//
//  Created by Fares Cherni on 27/02/2023.
//

import SwiftUI

public enum FontAlignment: String ,Codable , CaseIterable{
    case left = "left"
    case middle = "middle"
    case right = "right"
}

public enum TextCase: String , Codable , CaseIterable{
    case sentence = "sentence"
    case upperCase = "upperCase"
    case lowerCase = "lowerCase"
}

struct ThemeModel : Identifiable,Codable, Equatable {
    var id : String
    var fontName: String
    var fontAlignment: FontAlignment
    var fontColor: String
    var fontOpacity: Double 
    var textCase: TextCase
    var backgroundImage: String?
    var backgroundColor: String?
    var backgroundOpacity: Float
}

