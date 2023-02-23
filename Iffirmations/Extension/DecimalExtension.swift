//
//  DecimalExtension.swift
//  Iffirmations
//
//  Created by Fares Cherni on 23/02/2023.
//

import Foundation

extension Decimal{
    func Decimal2Digit()->String {
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.roundingMode = .down
        
        let string = formatter.string(for: self) ?? "???"
        return string
        
    }
}
