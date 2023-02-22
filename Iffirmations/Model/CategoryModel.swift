//
//  CategorysModel.swift
//  Iffirmations
//
//  Created by Fares Cherni on 21/02/2023.
//

import Foundation

struct CategoryModel : Identifiable,Codable  {
    var id: UUID = UUID()
    var title : String
    var isPremium: Bool = false
    var isSelected: Bool = false
}
