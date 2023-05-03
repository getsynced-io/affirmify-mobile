//
//  DateExtension.swift
//  Iffirmations
//
//  Created by Fares Cherni on 21/02/2023.
//

import Foundation

extension Date {
    func display(_ format : String )->String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
      return   dateFormatter.string(from: self)
    }
    
    func amPmFromDate() -> TimeConvention {
        let dateFormatter = DateFormatter()
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        dateFormatter.dateFormat = "a"
        return TimeConvention(rawValue:   dateFormatter.string(from: self) ) ?? .AM
    }
    enum TimeConvention : String{
        case AM,PM
}
    
    
    func addHours(_ hours : Int) -> Date{
        return Calendar.current.date(byAdding: .hour, value: hours, to: self) ?? self
    }
 
}



extension Date: RawRepresentable {
    public var rawValue: String {
        self.timeIntervalSinceReferenceDate.description
    }
    
    public init?(rawValue: String) {
        self = Date(timeIntervalSinceReferenceDate: Double(rawValue) ?? 0.0)
    }
}
