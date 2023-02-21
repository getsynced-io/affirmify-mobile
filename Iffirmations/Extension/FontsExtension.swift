//
//  FontsExtension.swift
//  Iffirmations
//
//  Created by Fares Cherni on 20/02/2023.
//

import SwiftUI


import Foundation
import SwiftUI
enum FontsExtension {

case IBMPlexSerifRegular
case IBMPlexSerifSemiBold
case IBMPlexSerifMedium
case IBMPlexSerifLight
case IBMPlexSerifBold

    
    // MAKE Sure that the names are correct otherwise you will get a runtime error
    func getUIFont(size : CGFloat)->UIFont{
        switch self {
        case .IBMPlexSerifRegular:
            return UIFont(name: "IBMPlexSerif-Regular", size: size)!
        case .IBMPlexSerifSemiBold:
            return UIFont(name: "IBMPlexSerif-SemiBold", size: size)!
        case .IBMPlexSerifMedium:
            return UIFont(name: "IBMPlexSerif-Medium", size: size)!
        case .IBMPlexSerifLight:
            return UIFont(name: "IBMPlexSerif-Light", size: size)!
        case .IBMPlexSerifBold:
            return UIFont(name: "IBMPlexSerif-Bold", size: size)!
        }
    }

    func getFont(size : CGFloat)-> Font{
        switch self {
        case .IBMPlexSerifRegular:
            return Font.custom("IBMPlexSerif-Regular", size: size)
        case .IBMPlexSerifSemiBold:
            return Font.custom("IBMPlexSerif-SemiBold", size: size)
        case .IBMPlexSerifMedium:
            return Font.custom("IBMPlexSerif-Medium", size: size)
        case .IBMPlexSerifLight:
            return Font.custom("IBMPlexSerif-Light", size: size)
        case .IBMPlexSerifBold:
            return Font.custom("IBMPlexSerif-Bold", size: size)
        }
    }
    
    
    
    
}




struct CustomFont: ViewModifier {
    let font : FontsExtension
    let size : CGFloat
    let lineHeight : CGFloat
    let color : Color
    var titleUIFont : UIFont{
        font.getUIFont(size: size)
    }

    var titleFont : Font {
        font.getFont(size: size)
    }
 
    func body(content: Content) -> some View {
        content
            .font(titleFont)
            .lineSpacing(lineHeight -  titleUIFont.lineHeight)
            .padding(.vertical, (lineHeight - titleUIFont.lineHeight) / 2)
            .foregroundColor(color)

    }
    
}




extension View {
  func customFont(font: FontsExtension,
                  size: CGFloat , lineHeight : CGFloat? = nil, color : Color)
    -> some View {
        modifier(CustomFont(font: font, size: size , lineHeight :  lineHeight ?? size + 8 , color: color))
  }
}

