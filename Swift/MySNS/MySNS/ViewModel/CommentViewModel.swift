//
//  CommentViewModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/21.
//

import SwiftUI
import Firebase

class CommentViewModel: ObservableObject {
    private let post: PostModel
    @Published var comments = [CommentModel]()
    
    init(post: PostModel) {
        self.post = post
        fetchComment()
    }
    
    func uploadComment(comment: String) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard let postId = post.id else { return }
        let data: [String:Any] = ["userName": user.userID,
                                  "profileImageUrl": user.profileImageUrl,
                                  "uid": user.id ?? "",
                                  "timestamp": Timestamp(date: Date()),
                                  "postOwnerUid": post.ownerUid,
                                  "commentText": comment]
        COLLECTION_POSTS.document(postId).collection("post-comments").addDocument(data: data)
        
        
        NotificationViewModel.uploadNofitication(toUid: self.post.ownerUid, type: .comment, post: post)
    }
    
    func fetchComment() {
        guard let postId = post.id else { return }
        let query = COLLECTION_POSTS.document(postId).collection("post-comments")
            .order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, _ in
            
            guard let addedDocs = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            
            self.comments.append(contentsOf: addedDocs.compactMap({ try? $0.document.data(as: CommentModel.self) }))
            
        }
    }
    
}
