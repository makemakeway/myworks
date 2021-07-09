//
//  AuthViewModel.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/07/08.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    let errorDict = [Optional("The email address is badly formatted.") : "올바른 이메일 형식이 아닙니다.",
                     Optional("The password is invalid or the user does not have a password.") : "비밀번호가 틀렸거나 유효하지 않은 사용자입니다."]
    
    var error = ""
    
    func login() {
        
    }
    
    var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
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
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            //로그인 실패
            guard result != nil, error == nil else {
                print("DEBUG: \(String(describing: error?.localizedDescription))")
                self.error = self.errorDict[error?.localizedDescription]!
                return
            }
            //로그인 성공
            print("Login Success")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
    }
    
    
}
