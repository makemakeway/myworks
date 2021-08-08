//
//  FeecCellViewModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/20.
//

import SwiftUI

class FeedCellViewModel: ObservableObject {
    @Published var post: PostModel
    
    // 댓글 시간 설정
    var timestampString: String {
        let fommatter = DateComponentsFormatter()
        let dateFommat = ["s": "초 전", "m":"분 전", "h": "시간 전", "d": "일 전", "w": "주 전"]
        
        fommatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        fommatter.maximumUnitCount = 1
        fommatter.unitsStyle = .abbreviated
        let timestampString = fommatter.string(from: post.timestamp.dateValue(), to: Date()) ?? ""
        let endIndex = timestampString.index(before: timestampString.endIndex)
        let dateValue = String(timestampString[..<endIndex])
        let dateInfo = String(timestampString[endIndex])
        return dateValue + (dateFommat[dateInfo] ?? "")
    }
    
    
    
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
        print("FeedCellViewModel init -> checkLike...")
    }
    
}
