//
//  AuthViewModel.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/07/08.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    func login() {
        
    }
    
    func registerUser(userName: String, email: String, password: String, profileImage: UIImage) {
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else { return }
        let fileName = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(fileName)
        
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: Image Upload Failed. \(error.localizedDescription)")
                return
            }
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print("DEBUG: creatUserError \(error.localizedDescription)")
                        return
                    }
                    
                    guard let user = result?.user else {return}
                    
                    let data = ["email": email,
                                "userName": userName,
                                "profileImageUrl": profileImageUrl,
                                "uid": user.uid]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        print("succes upload data")
                    }
                    
                }
                
            }
            
        }
    }
    
}
