//
//  CategoriesViewModel.swift
//  Iffirmations
//
//  Created by Fares Cherni on 21/02/2023.
//

import SwiftUI

class CategoryViewModel: ObservableObject{
    static let shared :  CategoryViewModel =  CategoryViewModel()
    #if os(iOS)
    @AppStorage("CategoryModelSelection",store: store) var selectedID: String = ""
    @AppStorage("CategoryModel",store: store) var categories: [CategoryModel]  =
    [
        CategoryModel(title: .Age,emoji : "🧓"),
        CategoryModel(title: .Alone, emoji: "🥀" ),
        CategoryModel(title: .Amazing, emoji: "🤩",isPremium: true),
        CategoryModel(title: .Beauty, emoji: "💅" ,isPremium: true),
        CategoryModel(title: .Business, emoji: "💼" ),
        CategoryModel(title: .Car, emoji: "🏎️",isPremium: true ),
        CategoryModel(title: .Change, emoji: "🦋",isPremium: true ),
        CategoryModel(title: .Cool, emoji: "😎" ),
        CategoryModel(title: .Dad, emoji: "👨" ,isPremium: true),
        CategoryModel(title: .Death, emoji: "💀" ,isPremium: true),
        CategoryModel(title: .Education, emoji: "🏫"),
        CategoryModel(title: .Experience, emoji: "📚",isPremium: true ),
        CategoryModel(title: .Famous, emoji: "📷",isPremium: true ),
        CategoryModel(title: .Family, emoji: "👨‍👩‍👧‍👦",isPremium: true ),
        CategoryModel(title: .Fear, emoji: "😱",isPremium: true ),
        CategoryModel(title: .Food, emoji: "🍋" ,isPremium: true),
        CategoryModel(title: .Funny, emoji: "😂",isPremium: true ),
        CategoryModel(title: .Future, emoji: "🔮",isPremium: true ),
        CategoryModel(title: .Health, emoji: "🥬",isPremium: true ),
        CategoryModel(title: .Home, emoji: "🏠",isPremium: true ),
        CategoryModel(title: .Hope, emoji: "🤞" ),
        CategoryModel(title: .Learning, emoji: "🧑‍🎓",isPremium: true ),
        CategoryModel(title: .Life, emoji: "🌎",isPremium: true ),
        CategoryModel(title: .Love, emoji: "❤️" ,isPremium: true),
        CategoryModel(title: .Marriage, emoji: "💍" ,isPremium: true),
        CategoryModel(title: .Mom, emoji: "🤱" ),
        CategoryModel(title: .Money, emoji: "💰",isPremium: true),
        CategoryModel(title: .Morning, emoji: "🌅" ,isPremium: true),
        CategoryModel(title: .Movies, emoji: "📽" ,isPremium: true),
        CategoryModel(title: .Music, emoji: "🎶" ,isPremium: true),
        CategoryModel(title: .Peace, emoji: "🧘",isPremium: true ),
        CategoryModel(title: .Politics, emoji: "📋",isPremium: true ),
        CategoryModel(title: .Relationship, emoji: "💑" ,isPremium: true),
        CategoryModel(title: .Religion, emoji: "🙏" ,isPremium: true),
        CategoryModel(title: .Respect, emoji: "🫡",isPremium: true),
        CategoryModel(title: .Science, emoji: "⚗️" ,isPremium: true),
        CategoryModel(title: .Sports, emoji: "🏅" ,isPremium: true),
        CategoryModel(title: .Success, emoji: "🙌" ,isPremium: true),
        CategoryModel(title: .Technology, emoji: "💻" ,isPremium: true),
        CategoryModel(title: .Time, emoji: "⌛",isPremium: true),
    ]
    #elseif os(watchOS)
    @AppStorage("CategoryModelSelection") var selectedID: String = ""
    @AppStorage("CategoryModel") var categories: [CategoryModel]  =
    [
        CategoryModel(title: .Age,emoji : "🧓"),
        CategoryModel(title: .Alone, emoji: "🥀" ),
        CategoryModel(title: .Amazing, emoji: "🤩",isPremium: true),
        CategoryModel(title: .Beauty, emoji: "💅" ,isPremium: true),
        CategoryModel(title: .Business, emoji: "💼" ),
        CategoryModel(title: .Car, emoji: "🏎️",isPremium: true ),
        CategoryModel(title: .Change, emoji: "🦋",isPremium: true ),
        CategoryModel(title: .Cool, emoji: "😎" ),
        CategoryModel(title: .Dad, emoji: "👨" ,isPremium: true),
        CategoryModel(title: .Death, emoji: "💀" ,isPremium: true),
        CategoryModel(title: .Education, emoji: "🏫"),
        CategoryModel(title: .Experience, emoji: "📚",isPremium: true ),
        CategoryModel(title: .Famous, emoji: "📷",isPremium: true ),
        CategoryModel(title: .Family, emoji: "👨‍👩‍👧‍👦",isPremium: true ),
        CategoryModel(title: .Fear, emoji: "😱",isPremium: true ),
        CategoryModel(title: .Food, emoji: "🍋" ,isPremium: true),
        CategoryModel(title: .Funny, emoji: "😂",isPremium: true ),
        CategoryModel(title: .Future, emoji: "🔮",isPremium: true ),
        CategoryModel(title: .Health, emoji: "🥬",isPremium: true ),
        CategoryModel(title: .Home, emoji: "🏠",isPremium: true ),
        CategoryModel(title: .Hope, emoji: "🤞" ),
        CategoryModel(title: .Learning, emoji: "🧑‍🎓",isPremium: true ),
        CategoryModel(title: .Life, emoji: "🌎",isPremium: true ),
        CategoryModel(title: .Love, emoji: "❤️" ,isPremium: true),
        CategoryModel(title: .Marriage, emoji: "💍" ,isPremium: true),
        CategoryModel(title: .Mom, emoji: "🤱" ),
        CategoryModel(title: .Money, emoji: "💰",isPremium: true),
        CategoryModel(title: .Morning, emoji: "🌅" ,isPremium: true),
        CategoryModel(title: .Movies, emoji: "📽" ,isPremium: true),
        CategoryModel(title: .Music, emoji: "🎶" ,isPremium: true),
        CategoryModel(title: .Peace, emoji: "🧘",isPremium: true ),
        CategoryModel(title: .Politics, emoji: "📋",isPremium: true ),
        CategoryModel(title: .Relationship, emoji: "💑" ,isPremium: true),
        CategoryModel(title: .Religion, emoji: "🙏" ,isPremium: true),
        CategoryModel(title: .Respect, emoji: "🫡",isPremium: true),
        CategoryModel(title: .Science, emoji: "⚗️" ,isPremium: true),
        CategoryModel(title: .Sports, emoji: "🏅" ,isPremium: true),
        CategoryModel(title: .Success, emoji: "🙌" ,isPremium: true),
        CategoryModel(title: .Technology, emoji: "💻" ,isPremium: true),
        CategoryModel(title: .Time, emoji: "⌛",isPremium: true),
    ]
    #endif
    

}
