//
//  UserConfiguration.swift
//  Iffirmations
//
//  Created by Fares Cherni on 21/02/2023.
//

import Foundation


struct UserConfiguration  : Codable{
    var quantity : Int
    var from : Date
    var to : Date
    init(quantity: Int = 0 , from: Date = Date(), to: Date = Date()) {
        self.quantity = quantity
        self.from = from
        self.to = to
    }
    enum CodingKeys: String, CodingKey {
        case quantity, from, to
    }

}



extension UserConfiguration : RawRepresentable {
    var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
                let result = String(data: data, encoding: .utf8)
          else {
              return ""
          }

          return result
    }
    
    init?(rawValue: String) {
           guard let data = rawValue.data(using: .utf8),
                 let result = try? JSONDecoder().decode(UserConfiguration.self, from: data)
           else { return nil }

           self = result
       }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(from, forKey: .from)
        try container.encode(to, forKey: .to)
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        quantity = try container.decode(Int.self, forKey: .quantity)
        from = try container.decode(Date.self, forKey: .from)
        to = try container.decode(Date.self, forKey: .to)
    }
}
