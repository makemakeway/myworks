//
//  UploadPostViewModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/19.
//

import SwiftUI
import Firebase

class UploadPostViewModel: ObservableObject {
    func UploadPost(caption: String, image: UIImage, completion: FireStoreCompletion) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let uid = user.id else { return }
        
        
        ImageUploader.uploadImage(image: image, type: .post) { imageUrl in
            let data = ["caption": caption,
                        "timestamp": Timestamp(date: Date()),
                        "likes": 0,
                        "imageUrl": imageUrl,
                        "ownerUid": uid,
                        "ownerImageUrl": user.profileImageUrl,
                        "ownerUserId": user.userID] as [String : Any]
            
            COLLECTION_POSTS.addDocument(data: data, completion: completion)
            
            
        }
    }
}
