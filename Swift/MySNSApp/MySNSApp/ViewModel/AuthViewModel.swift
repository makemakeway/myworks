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
    
    var signInError = ""
    
    // 유저가 로그인 되었는지 추적
    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    @Published var user: User?
    
    init() {
        userSession = Auth.auth().currentUser
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
                print("ERROR: Image Upload Failed. \(error.localizedDescription)")
                return
            }
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteString else { return }
                
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print("ERROR: creatUserError \(error.localizedDescription)")
                        return
                    }
                    
                    guard let user = result?.user else {return}
                    
                    let data = ["email": email,
                                "userName": userName,
                                "profileImageUrl": profileImageUrl,
                                "profileMessage": "",
                                "uid": user.uid]
                    
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        print("success upload data")
                        self.userSession = user
                    }
                    
                }
                
            }
            
        }
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            //로그인 실패
            guard result != nil, error == nil else {
                print("ERROR: \(String(describing: error?.localizedDescription))")
                guard self.errorDict[error?.localizedDescription] == nil else {
                    self.signInError = self.errorDict[error?.localizedDescription]!
                    return
                }
                return
            }
            //로그인 성공
            print("Login Success")
            self.userSession = result?.user
        }
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    
    func feachUser() {
        guard let uid = userSession?.uid else { return }
        Firestore.firestore().collection("users").document(uid).getDocument { snapShot, _ in
            guard let data = snapShot?.data() else { return }
            let user = User(dictionary: data)
            print("DEBUG: user is \(user.username)")
        }
    }
}
