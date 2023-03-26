//
//  FilesManager.swift
//  Iffirmations
//
//  Created by Fares Cherni on 06/03/2023.
//

import UIKit

class LocalFileManager {
    
    static let instance = LocalFileManager()
    let session  = DispatchQueue(label: "SaveIffirmation", qos: .background, autoreleaseFrequency: .inherit, target: nil)
    
    func saveImageToFile(image: UIImage, filename: String) -> Bool {
        guard let data = image.jpegData(compressionQuality: 1.0) else {
            return false
        }

        let fileManager = FileManager.default
        guard let containerURL = fileManager.containerURL(forSecurityApplicationGroupIdentifier: "group.IffirmationsMobileQuotes") else {
            return false
        }

        let fileURL = containerURL.appendingPathComponent(filename)

        do {
            try data.write(to: fileURL)
            return true
        } catch {
            print("Error saving image: \(error)")
            return false
        }
    }


    func retrieveImageFromFile(filename: String) -> UIImage? {
        let fileManager = FileManager.default
        guard let containerURL = fileManager.containerURL(forSecurityApplicationGroupIdentifier: "group.IffirmationsMobileQuotes") else {
            return nil
        }

        let fileURL = containerURL.appendingPathComponent(filename)

        guard let data = try? Data(contentsOf: fileURL) else {
            return nil
        }

        return UIImage(data: data)
    }

    
    
}
