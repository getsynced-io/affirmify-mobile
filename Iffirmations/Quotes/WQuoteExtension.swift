//
//  WQuoteExtension.swift
//  Iffirmations
//
//  Created by Fares Cherni on 08/03/2023.
//

import Foundation


protocol WQuoteBase  {
    var author: String { get set }

    var genre: String { get set }

    var placeID: String  { get set }

    var text: String { get set }
    
}

struct WQuoteFavorite : WQuoteBase  ,  Codable{
    var author: String = String()

    var genre: String = String()

    var placeID: String = String()

    var text: String = String()
    
   
}
