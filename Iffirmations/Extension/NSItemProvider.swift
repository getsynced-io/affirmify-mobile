//
//  NSItemProvider.swift
//  Iffirmations
//
//  Created by Fares Cherni on 06/03/2023.
//

import SwiftUI
import PhotosUI

extension  NSItemProvider  {
    func getImagePath(completion :@escaping ( _ result :String?) ->()){
        if self.canLoadObject(ofClass: UIImage.self) {
            self.loadObject(ofClass: UIImage.self) {image, _ in
                DispatchQueue.main.async {
                    if let image = image  as? UIImage {
                        let cpmressedImage = image.limitTo2k()
                        let path = LocalFileManager.instance.saveImage(image: cpmressedImage, name: "\(UUID().uuidString)", folderName: "Iffirmation")
                        completion(path)
                    }
                    else {
                        completion(nil)
                    }
                }
            }
        }
    }
}
