//
//  StringExtension.swift
//  Iffirmations
//
//  Created by Fares Cherni on 28/02/2023.
//

import UIKit

extension String {
    func openUrl(){
        let url = URL(string: self)!
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
extension String {
    func mailTo(){
        let appURL = URL(string: "mailto:\(self)")
        if let appURL = appURL{
            UIApplication.shared.open(appURL, options: [:], completionHandler: nil)
        }
    }
}
