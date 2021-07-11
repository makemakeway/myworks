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
                     Optional("The password is invalid or the user does not have a password.") : "비밀번호가 틀렸습니다.",
                     Optional("There is no user record corresponding to this identifier. The user may have been deleted.") : "일치하는 사용자가 없습니다. 아이디를 확인해주세요.",
                     Optional("The email address is already in use by another account.") : "이미 사용중인 이메일입니다.",
                     Optional("The password must be 6 characters long or more.") : "비밀번호는 6글자 이상으로 입력해주세요."
                     
    ]
    
    @Published var isError = false
    @Published var errorMessage = ""
    
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
                        guard self.errorDict[error.localizedDescription] == nil else {
                            self.errorMessage = self.errorDict[error.localizedDescription]!
                            self.isError = true
                            return
                        }
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
                    self.errorMessage = self.errorDict[error?.localizedDescription]!
                    self.isError = true
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
