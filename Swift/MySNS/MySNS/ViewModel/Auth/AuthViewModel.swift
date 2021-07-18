//
//  AuthViewModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/17.
//

import Foundation
import Firebase
import SwiftUI

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var userViewModel: UserViewModel
    
    init() {
        userSession = Auth.auth().currentUser
        userViewModel = .init(userName: "", userID: "", email: "", imageUrl: "", id: "")
    }
    
    func registerUser(email: String, password: String, userName: String, userID: String, image: UIImage) {
        
        ImageUploader.uploadImage(image: image) { imageUrl in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error  {
                    print("DEBUG: \(error.localizedDescription)")
                    return
                }
                
                guard let user = result?.user else { return }
                
                let data = ["email": email,
                            "userName": userName,
                            "userID": userID,
                            "uid": user.uid,
                            "profileImageUrl": imageUrl
                ]
                
                Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                    self.userSession = user
                }
            }
        }
        
        
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                print("DEBUG: LoginError, \(String(describing: error?.localizedDescription))")
                return
            }
            
            print("DEBUG: Login Success")
            self.userSession = result?.user
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword() {
        
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                print("DEBUG: fetchUser Failed... \(error.localizedDescription)")
                return
            }
            guard let data = snapshot?.data() else {
                print("DEBUG: Snapshot error... \(String(describing: error?.localizedDescription))")
                return
            }
            let user = User(dictionary: data)

            self.userViewModel.email = user.email
            self.userViewModel.userID = user.userID
            self.userViewModel.userName = user.userName
            self.userViewModel.id = user.id
            self.userViewModel.imageUrl = user.imageUrl
        }
    }
}

struct UserViewModel {
    var userName: String
    var userID: String
    var email: String
    var imageUrl: String
    var id: String
}
