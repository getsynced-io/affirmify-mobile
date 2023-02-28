//
//  CategoriesViewModel.swift
//  Iffirmations
//
//  Created by Fares Cherni on 21/02/2023.
//

import SwiftUI

class CategoryViewModel: ObservableObject{
    static let shared :  CategoryViewModel =  CategoryViewModel()
    @AppStorage("CategoryModel") var categories: [CategoryModel]  =
    [
      
        CategoryModel(title: .Alone,isPremium: true),
        CategoryModel(title: .Anxiety ,isPremium: true),
        CategoryModel(title: .Attitude ),
        CategoryModel(title: .Change ),
        CategoryModel(title: .Choice ,isPremium: true),
        CategoryModel(title: .Confidence ),
        CategoryModel(title: .Courage ),
        CategoryModel(title: .Death ,isPremium: true),
        CategoryModel(title: .Dream ),
        CategoryModel(title: .Excellence ),
        CategoryModel(title: .Failure ,isPremium: true),
        CategoryModel(title: .Fear ),
        CategoryModel(title: .Forgiveness ),
        CategoryModel(title: .Freedom ),
        CategoryModel(title: .Friendship ),
        CategoryModel(title: .Future ),
        CategoryModel(title: .Gym ),
        CategoryModel(title: .Happiness ),
        CategoryModel(title: .Health ),
        CategoryModel(title: .Inspiration ),
        CategoryModel(title: .Kindness ,isPremium: true),
        CategoryModel(title: .Leadership ),
        CategoryModel(title: .Life ),
        CategoryModel(title: .Love ),
        CategoryModel(title: .Motivation ),
        CategoryModel(title: .Nature ,isPremium: true),
        CategoryModel(title: .Pain),
        CategoryModel(title: .Past ),
        CategoryModel(title: .Positive ),
        CategoryModel(title: .Reading ),
        CategoryModel(title: .Relationship ),
        CategoryModel(title: .Smile ),
        CategoryModel(title: .Sports ),
        CategoryModel(title: .Strength ),
        CategoryModel(title: .Success),
        CategoryModel(title: .Time ),
        CategoryModel(title: .Today ),
        CategoryModel(title: .Trust ),
        CategoryModel(title: .Truth ),
        CategoryModel(title: .Wisdom ),
        CategoryModel(title: .Work ),
        CategoryModel(title: .Workout ),
    ]
    
    

}
