//
//  ImagePicker.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/07/07.
//


import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIImagePickerController
    @Environment(\.presentationMode) var mode // 뷰 컨트롤러의 노출 여부
    
    let sourceType: UIImagePickerController.SourceType
    let imagePicked: (UIImage) -> ()
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.imagePicked(image)
                parent.mode.wrappedValue.dismiss()
            }
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.mode.wrappedValue.dismiss()
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        
        picker.delegate = context.coordinator
        
        return picker
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}
