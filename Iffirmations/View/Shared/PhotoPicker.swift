//
//  PhotoPicker.swift
//  Iffirmations
//
//  Created by Fares Cherni on 06/03/2023.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    let configuration: PHPickerConfiguration =  PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
    let coompletionHandler : ( _ results: [PHPickerResult])->()
    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = configuration
        configuration.filter = .images
        configuration.selectionLimit =  1
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
    

        return controller
    }
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
    func makeCoordinator() -> Coordinator {
        Coordinator(self, coompletionHandler:  coompletionHandler)
    }
    
    // Use a Coordinator to act as your PHPickerViewControllerDelegate
    class Coordinator: PHPickerViewControllerDelegate {
       
        private let parent: PhotoPicker
        var count : Int = 0
        let coompletionHandler : ( _ results: [PHPickerResult])->()
        init(_ parent: PhotoPicker ,  coompletionHandler : @escaping ( _ results: [PHPickerResult])->()) {
            self.parent = parent
            self.coompletionHandler  =  coompletionHandler
        }
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
          
            coompletionHandler(results)
            picker.dismiss(animated: true)
            
        }
    }
}

