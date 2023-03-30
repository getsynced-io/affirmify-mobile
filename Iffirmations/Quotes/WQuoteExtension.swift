//
//  WQuoteExtension.swift
//  Iffirmations
//
//  Created by Fares Cherni on 08/03/2023.
//

import Foundation


protocol WQuoteBase  {
    var author: String { get set }

    var categories: [String] { get set }

    var placeID: Int32 { get set }

    var text: String { get set }

    var wordCount: Int32 { get set }
}

struct WQuoteFavorite : WQuoteBase  ,  Codable , Equatable{
    var author: String = String()

    var categories: [String] = []

    var placeID: Int32 = 0

    var text: String = String()

    var wordCount: Int32 = 0
    
   
}
