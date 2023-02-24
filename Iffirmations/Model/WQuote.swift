//
//  WQuote.swift
//  Iffirmations
//
//  Created by Fares Cherni on 24/02/2023.
//

import SwiftUI

struct WQuote : Codable {
    let author : String
    let categories : [String]
    let placeId : Int
    let text : String
    let wordCount : Int
    
}


enum QuoteCategory : String {
    case alone, anxiety,attitude, change ,choice,confidence, courage, death,dream, Excellence , failure, fear , forgiveness,freedom, friendship, future, gym , happiness, health, inspiration,kindness, leadership, life ,love ,motivation,nature , pain , past , positive, reading

}
