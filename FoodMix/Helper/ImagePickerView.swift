//
//  ImagePickerView.swift
//  FoodMix
//
//  Created by Yuan on 10/03/2022.
//

import SwiftUI
import PhotosUI

struct PhotoPicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = PHPickerViewController
    
    
    let configuration: PHPickerConfiguration
    
    @Binding var isPresented: Bool
    
    var picked: (_ results: [PHPickerResult]) -> Void
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, picked: picked)
    }
    
    // Use a Coordinator to act as your PHPickerViewControllerDelegate
    class Coordinator: PHPickerViewControllerDelegate {
      
        private let parent: PhotoPicker
        private var picked: (_ results: [PHPickerResult]) -> Void
        
        init(_ parent: PhotoPicker, picked: @escaping (_ results: [PHPickerResult]) -> Void) {
            self.parent = parent
            self.picked = picked
        }
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            parent.isPresented = false
            picked(results)
        }
    }
}
