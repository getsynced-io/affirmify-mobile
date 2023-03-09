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
//        print("start Encode")
//        print("from \(from)")
//        print("to \(to)")
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(quantity, forKey: .quantity)
        try container.encode(from.timeIntervalSince1970, forKey: .from)
        try container.encode(to.timeIntervalSince1970, forKey: .to)
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        quantity = try container.decode(Int.self, forKey: .quantity)
       let  fromTimeInterval  = try container.decode(Double.self, forKey: .from)
       let  toTimeInterval = try container.decode(Double.self, forKey: .to)
        from = Date(timeIntervalSince1970: fromTimeInterval)
        to = Date(timeIntervalSince1970: toTimeInterval)
//        print("devcoded")
//        print("from \(from)")
//        print("to \(to)")
    }
}
