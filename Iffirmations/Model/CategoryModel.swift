//
//  CategorysModel.swift
//  Iffirmations
//
//  Created by Fares Cherni on 21/02/2023.
//

import Foundation

struct CategoryModel : Codable  {
    var title : QuoteCategory
    var emoji : String
    var isPremium: Bool = false
    var isSelected: Bool = false
    
}

enum QuoteCategory : String, Codable, CaseIterable {
   // case Alone, Anxiety,Attitude, Change ,Choice,Confidence, Courage, Death,Dream, Excellence , Failure, Fear , Forgiveness,Freedom, Friendship, Future, Gym , Happiness, Health, Inspiration,Kindness, Leadership, Life ,Love ,Motivation,Nature , Pain , Past , Positive, Reading,Relationship, Smile , Sports , Strength , Success , Time , Today , Trust , Truth , Wisdom , Work , Workout
    case  Age , Alone , Amazing , Beauty , Business , Car , Change , Cool , Dad , Death , Education , Experience , Famous , Family , Fear , Food , Funny , Future , Health , Home , Hope , Learning , Life , Love , Marriage , Mom , Money , Morning , Movies , Music , Peace , Politics , Relationship , Religion , Respect , Science , Sports , Success , Technology , Time

}
