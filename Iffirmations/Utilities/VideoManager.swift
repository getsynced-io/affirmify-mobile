//
//  VideoManager.swift
//  Affirmify
//
//  Created by Fares Cherni on 04/07/2023.
//

import SwiftUI
import Foundation

class VideoManager {
    static let shared = VideoManager()
    private let fileManager = FileManager.default

    func getDocumentsDirectory() -> URL? {
        return fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
    }
    
    func getFileURL(for fileId: String) -> URL? {
        guard let documentsDirectory = getDocumentsDirectory() else {
            return nil
        }
        
        return documentsDirectory.appendingPathComponent("\(fileId).mp4")
    }

    func doesFileExist(for fileId: String) -> Bool {
        guard let fileURL = getFileURL(for: fileId) else {
            return false
        }
        
        return fileManager.fileExists(atPath: fileURL.path)
    }


    func downloadVideo(id fileId: String,from url: URL) async throws  {
        guard let documentsDirectory = getDocumentsDirectory() else {
            throw VideoError.failedToAccessDirectory
        }
        
        let destinationURL = documentsDirectory.appendingPathComponent("\(fileId).mp4")
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        try data.write(to: destinationURL)
        print("save \(fileId) done")
        
    }

    func downloadAndSaveVideo(id: String, from url: URL) async throws {
        if !doesFileExist(for: id) {
            try await downloadVideo(id: id, from: url)
        }
        else {
            print("fileID \(id) exist")
        }
    }
}

enum VideoError: Error {
    case failedToAccessDirectory
}
