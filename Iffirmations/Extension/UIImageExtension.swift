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
        return size.width > 2000 || size.height > 2000
    }

    
    func decompress(url: URL)-> UIImage{
        let dict = [kCGImageSourceShouldCache: NSNumber(value: true)]
        let source = CGImageSourceCreateWithURL(url as CFURL, nil)
        let cgImage = CGImageSourceCreateImageAtIndex(source!, 0, dict as CFDictionary)
        let retImage = UIImage(cgImage: cgImage!)
        return retImage
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
            let availableSize = availableRect.size

            let format = UIGraphicsImageRendererFormat()
            format.scale = 1
            let renderer = UIGraphicsImageRenderer(size: availableSize, format: format)

            let resized = renderer.jpegData(withCompressionQuality: 0.7) { rend in
                self.draw(in: CGRect(origin: .zero, size: availableSize))
            }
      
            return UIImage(data: resized) ?? self //resized
        }
    }
}
