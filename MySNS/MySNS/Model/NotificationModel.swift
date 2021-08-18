//
//  NotificationModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/21.
//

import FirebaseFirestoreSwift
import Firebase

struct NotificationModel: Identifiable, Decodable {
    @DocumentID var id: String?
    var postId: String?
    let userId: String
    let profileImageUrl: String
    let type: NotificationType
    let uid: String
    let timestamp: Timestamp
    
    var isFollowed: Bool? = false
    var post: PostModel?
    var user: UserModel?
}


enum NotificationType: Int, Decodable {
    case like
    case comment
    case follow
    
    var notificationMessage: String {
        switch self {
        case .like: return "님이 회원님의 게시물을 좋아합니다."
        case .comment: return "님이 회원님의 게시물에 댓글을 남겼습니다."
        case .follow: return "님이 회원님을 팔로우하기 시작했습니다."
        }
    }
}
