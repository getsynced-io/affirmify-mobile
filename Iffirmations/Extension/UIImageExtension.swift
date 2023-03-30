//
//  UIImageExtension.swift
//  Iffirmations
//
//  Created by Fares Cherni on 06/03/2023.
//

import UIKit
import AVFoundation

public extension UIImage {
    private func isOver2k() -> Bool {
        return max(size.width, size.height) > 2000
    }


    func limitTo2k() -> UIImage{
    let targetSize = CGSize(width: 2000, height: 2000)
        if isOver2k(){
   
            
            return   resizeTestMain(toSize: targetSize)
        }
        else {
            return self
        }
}
    
    
    
    func resizeTestMain(toSize targetSize: CGSize)-> UIImage{
        autoreleasepool {
            let availableRect = AVFoundation.AVMakeRect(aspectRatio: self.size, insideRect: .init(origin: .zero, size: targetSize))
            let availableSize = CGSize(width:CGFloat(Int(availableRect.size.width)), height: CGFloat(Int(availableRect.size.height)))
            
            print("availableSize \(availableSize)")
            print("size  \(self.size)")

            let format = UIGraphicsImageRendererFormat()
            format.scale = 1
            let renderer = UIGraphicsImageRenderer(size: availableSize, format: format)

            let resized = renderer.jpegData(withCompressionQuality: 0.7) { rend in
                self.draw(in: CGRect(origin: .zero, size: availableSize))
            }
      
            return UIImage(data: resized) ?? self
        }
    }
}


extension UIImage {
    
    func share(completion : @escaping ()->()){
        
        guard let data =  self.pngData() else {return}
        let activityVC = UIActivityViewController(activityItems: [data], applicationActivities: nil)

        if let vc = UIApplication.shared.keyWindowPresentedController {
            activityVC.popoverPresentationController?.sourceView = vc.view
            activityVC.popoverPresentationController?.sourceRect = sourceRect
            activityVC.popoverPresentationController?.permittedArrowDirections = []
                   vc.present(activityVC, animated: true, completion: nil)
               }
        activityVC.completionWithItemsHandler = { activity, completed, items, error in
            completion()
        }
    
    }
    
}
