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



extension String {
    
    func shareAsUrl(){
        
        let appURL = URL(string: self)!
        let activityVC = UIActivityViewController(activityItems: [appURL], applicationActivities: nil)

        if let vc = UIApplication.shared.keyWindowPresentedController {
            activityVC.popoverPresentationController?.sourceView = vc.view
            activityVC.popoverPresentationController?.sourceRect = sourceRect
            activityVC.popoverPresentationController?.permittedArrowDirections = []
                   vc.present(activityVC, animated: true, completion: nil)
               }
        activityVC.completionWithItemsHandler = { activity, completed, items, error in
        }
    
    }
    
}

let sourceRect =  CGRect(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2 , width: 0, height: 0)
