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
    @Published var currentUser: UserModel?
    @Published var didReset = false
    
    
    static let shared = AuthViewModel()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
    }
    
    func registerUser(email: String, password: String, userName: String, userID: String) {
        
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
                        "profileImageUrl": ""
            ]
            
            COLLECTION_USERS.document(user.uid).setData(data) { _ in
                self.userSession = user
                self.fetchUser()
            }
        }
        
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                print("DEBUG: LoginError, \(String(describing: error?.localizedDescription))")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func signOut() {
        self.userSession = nil
        try? Auth.auth().signOut()
    }
    
    func resetPassword(withEmail email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("DEBUG: reset Password Error \(error.localizedDescription)")
                return
            }
            
            self.didReset = true
        }
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: UserModel.self) else { return }
            self.currentUser = user
            AuthViewModel.shared.userSession = self.userSession
            AuthViewModel.shared.currentUser = self.currentUser
        }
    }
}
