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
    
    

    @discardableResult
    func createFolderIfNeeded(folderName : String)-> String?{
        guard
            let path = FileManager
                .default
                .urls(for:.libraryDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else {
                 return nil
                   }
        
        if !FileManager.default.fileExists(atPath: path) {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                print("Success creating folder.")
                return path
            } catch let error {
                print("Error creating folder. \(error)")
                return nil
            }
        }
        return path
    }
    
    func deleteFolder(folderName : String) throws {
        guard
            let path = FileManager
                .default
                .urls(for: .libraryDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .path else {
            return
        }
        do {
            try FileManager.default.removeItem(atPath: path)
            print("Success deleting folder.")
        } catch let error {
            print("Error deleting folder. \(error)")
            throw error
        }
        
    }
    func contentOfFolder(folderUrl : URL) -> [URL]? {
                 do {
                
                   let urls =   try FileManager.default.contentsOfDirectory(at: folderUrl, includingPropertiesForKeys: nil)
                    // print("url \(folderUrl)")
                   //  print("urls \(urls)")
                     return urls
               } catch {
                   print("empty \(folderUrl)")
                   return nil
               }
        
    }
    

    
    
    @discardableResult
    func saveImage(image: UIImage, name: String,folderName : String,isPNG : Bool = false) -> String?{
        autoreleasepool {
            
            createFolderIfNeeded(folderName: folderName)
        guard
            let data =  isPNG ? image.pngData() : image.jpegData(compressionQuality: 1.0),
            let path = getPathForImage(name: name,folderName: folderName,isPNG: isPNG) else { return  nil }
            do {
                try data.write(to: path, options: .atomic)
                return path.path
            }catch {
                return  nil
                
            }
        }
    }
    
    
    func saveImage(image: UIImage, path : URL ) -> Bool{
        autoreleasepool {
        guard
            let data =  image.jpegData(compressionQuality: 1.0) else {return false}
            do {
                try data.write(to: path, options: .atomic)
                return true
            }catch {
                print("error \(error)")
                return false
                
            }
              
                
  
        }
    }
    
    
    
    
    func getImage(name: String,folderName : String,isPNG : Bool = false) -> UIImage? {
        guard
            let path = getPathForImage(name: name,folderName: folderName,isPNG: isPNG)?.path,
            FileManager.default.fileExists(atPath: path) else {
            print("Error getting path.")
            return nil
        }
        
        return UIImage(contentsOfFile: path)
    }
    
    
    
    func fetchImage(with imageName: String , sessionPath : String) -> UIImage? {
        autoreleasepool {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        if let path = paths.first {
            let imageURL = URL(fileURLWithPath: path).appendingPathComponent(sessionPath).appendingPathComponent(imageName)
            return UIImage(contentsOfFile: imageURL.path)
         
            
            
        }
        return nil
    }
    }
    
    @discardableResult
    func deleteImage(name: String?,folderName : String) -> String {
        guard
            let name  = name ,
            let path = getPathForImage(name: name, folderName: folderName)?.path,
            FileManager.default.fileExists(atPath: path) else {
            return "Error getting path."
        }
        
        do {
            try FileManager.default.removeItem(atPath: path)
            return "Sucessfully deleted."
        } catch let error {
            return "Error deleting image. \(error)"
        }
        
    }


    
    func getPathForImage(name: String ,folderName : String,isPNG : Bool = false) -> URL? {
        let fileExtension = isPNG ? ".png" : ".jpg"
        guard
            let path = FileManager
                .default
                .urls(for: .libraryDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                .appendingPathComponent("\(name)\(fileExtension)") else {
            return nil
        }
        
        return path
    }
    
    func getPathForFolder(folderName : String) -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .libraryDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(folderName)
                 else {
                 return nil
                   }
        
        return path
    }
}
