//
//  FeecCellViewModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/20.
//

import SwiftUI

class FeedCellViewModel: ObservableObject {
    @Published var post: PostModel
    
    
    init(post: PostModel) {
        self.post = post
        checkLike()
    }
    
    func like() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        COLLECTION_POSTS.document(postId).collection("post-likes").document(uid).setData([:]) { _ in
            COLLECTION_USERS.document(uid).collection("user-likes").document(postId).setData([:]) { _ in
                
                COLLECTION_POSTS.document(postId).updateData(["likes" : self.post.likes + 1])
                
                NotificationViewModel.uploadNofitication(toUid: self.post.ownerUid, type: .like, post: self.post)
                
                self.post.didLiked = true
                self.post.likes += 1
            }
        }
    }
    func unlike() {
        guard post.likes > 0 else { return }
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_POSTS.document(postId).collection("post-likes").document(uid).delete { _ in
            COLLECTION_USERS.document(uid).collection("user-likes").document(postId).delete { _ in
                COLLECTION_POSTS.document(postId).updateData(["likes" : self.post.likes - 1])
                self.post.didLiked = false
                self.post.likes -= 1
            }
        }
    }
    func checkLike() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        guard let postId = post.id else { return }
        
        COLLECTION_USERS.document(uid).collection("user-likes").document(postId).getDocument { snapshot, _ in
            guard let didLiked = snapshot?.exists else { return }
            self.post.didLiked = didLiked
        }
    }
    
}
