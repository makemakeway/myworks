//
//  EditProfileViewModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/23.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    @Published var user: UserModel
    @Published var uploadComplete = false
    
    init(user: UserModel) {
        self.user = user
    }
    
    func saveUserData(bio: String, userId: String, userName: String) {
        guard let uid = user.id else { return }
        COLLECTION_USERS.document(uid).updateData(["bio":bio, "userID":userId, "userName":userName]) { _ in
            self.uploadComplete = true
        }
    }
    
    func UploadProfileImage(image: UIImage, completion: FireStoreCompletion) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
            guard let uid = user.id else { return }
            let data = ["profileImageUrl": imageUrl]
            self.user.profileImageUrl = imageUrl
            COLLECTION_USERS.document(uid).updateData(data)
        }
    }
}
