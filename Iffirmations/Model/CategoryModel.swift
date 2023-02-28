//
//  CategorysModel.swift
//  Iffirmations
//
//  Created by Fares Cherni on 21/02/2023.
//

import Foundation

struct CategoryModel : Identifiable,Codable  {
    var id: UUID = UUID()
    var title : QuoteCategory
    var isPremium: Bool = false
    var isSelected: Bool = false
}

enum QuoteCategory : String, Codable, CaseIterable {
    case Alone, Anxiety,Attitude, Change ,Choice,Confidence, Courage, Death,Dream, Excellence , Failure, Fear , Forgiveness,Freedom, Friendship, Future, Gym , Happiness, Health, Inspiration,Kindness, Leadership, Life ,Love ,Motivation,Nature , Pain , Past , Positive, Reading,Relationship, Smile , Sports , Strength , Success , Time , Today , Trust , Truth , Wisdom , Work , Workout

}
