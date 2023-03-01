//
//  SharedTimer.swift
//  Iffirmations
//
//  Created by Fares Cherni on 01/03/2023.
//

import SwiftUI

class SharedAdTimer {
    static let shared = SharedAdTimer()
    enum adSourceType {
        case category
        case theme
        case none
    }

    var isAbleToPresentAds: Bool = true
    var categoryType: adSourceType = .none
    func addDelay() {
        if isAbleToPresentAds {
            isAbleToPresentAds = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 30) { [weak self] in
                self?.isAbleToPresentAds = true
            }
        }
    }
}


class SharedCouter {
   static let shared : SharedCouter = SharedCouter()
    var categoryAdCounter : Int = 3
    var ThemeAddCounter : Int = 3
}





