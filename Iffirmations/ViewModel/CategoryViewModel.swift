//
//  CategoriesViewModel.swift
//  Iffirmations
//
//  Created by Fares Cherni on 21/02/2023.
//

import SwiftUI

class CategoryViewModel: ObservableObject{
    static let shared :  CategoryViewModel =  CategoryViewModel()
    @AppStorage("CategoryModelSelection",store: store) var selectedID: String = ""
    @AppStorage("CategoryModel",store: store) var categories: [CategoryModel]  =
    [
        CategoryModel(title: .Alone),
        CategoryModel(title: .Anxiety ),
        CategoryModel(title: .Attitude ,isPremium: true),
        CategoryModel(title: .Change ,isPremium: true),
        CategoryModel(title: .Choice ),
        CategoryModel(title: .Confidence,isPremium: true ),
        CategoryModel(title: .Courage,isPremium: true ),
        CategoryModel(title: .Death ),
        CategoryModel(title: .Dream ,isPremium: true),
        CategoryModel(title: .Excellence ,isPremium: true),
        CategoryModel(title: .Failure),
        CategoryModel(title: .Fear,isPremium: true ),
        CategoryModel(title: .Forgiveness,isPremium: true ),
        CategoryModel(title: .Freedom,isPremium: true ),
        CategoryModel(title: .Friendship,isPremium: true ),
        CategoryModel(title: .Future ,isPremium: true),
        CategoryModel(title: .Gym,isPremium: true ),
        CategoryModel(title: .Happiness,isPremium: true ),
        CategoryModel(title: .Health,isPremium: true ),
        CategoryModel(title: .Inspiration,isPremium: true ),
        CategoryModel(title: .Kindness ),
        CategoryModel(title: .Leadership,isPremium: true ),
        CategoryModel(title: .Life,isPremium: true ),
        CategoryModel(title: .Love ,isPremium: true),
        CategoryModel(title: .Motivation ,isPremium: true),
        CategoryModel(title: .Nature ),
        CategoryModel(title: .Pain,isPremium: true),
        CategoryModel(title: .Past ,isPremium: true),
        CategoryModel(title: .Positive ,isPremium: true),
        CategoryModel(title: .Reading ,isPremium: true),
        CategoryModel(title: .Relationship,isPremium: true ),
        CategoryModel(title: .Smile,isPremium: true ),
        CategoryModel(title: .Sports ,isPremium: true),
        CategoryModel(title: .Strength ,isPremium: true),
        CategoryModel(title: .Success,isPremium: true),
        CategoryModel(title: .Time ,isPremium: true),
        CategoryModel(title: .Today ,isPremium: true),
        CategoryModel(title: .Trust ,isPremium: true),
        CategoryModel(title: .Truth ,isPremium: true),
        CategoryModel(title: .Wisdom ,isPremium: true),
        CategoryModel(title: .Work ,isPremium: true),
        CategoryModel(title: .Workout ,isPremium: true),
    ]
//
    

}
