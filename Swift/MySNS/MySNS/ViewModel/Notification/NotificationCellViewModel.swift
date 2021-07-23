//
//  NotificationCellViewModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/21.
//

import SwiftUI

class NotificationCellViewModel: ObservableObject {
    @Published var notification: NotificationModel
    
    init(notification: NotificationModel) {
        self.notification = notification
        checkFollowed()
        fetchNotificationPost()
        fetchNotificationUser()
    }
    
    var timestampString: String {
        let fommatter = DateComponentsFormatter()
        fommatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        fommatter.maximumUnitCount = 1
        fommatter.unitsStyle = .abbreviated
        return fommatter.string(from: notification.timestamp.dateValue(), to: Date()) ?? ""
    }
    
    func follow() {
        UserService.follow(uid: notification.uid) { _ in
            NotificationViewModel.uploadNofitication(toUid: self.notification.uid, type: .follow)
            self.notification.isFollowed = true
        }
    }
    
    func unfollow() {
        UserService.unfollow(uid: notification.uid) { _ in
            self.notification.isFollowed = false
        }
        
    }
    
    func checkFollowed() {
        guard notification.type == .follow else { return }
        UserService.checkFollow(uid: notification.uid) { isFollowed in
            self.notification.isFollowed = isFollowed
        }
    }
    
    func fetchNotificationPost() {
        guard let postId = notification.postId else { return }
        COLLECTION_POSTS.document(postId).getDocument { snapshot, _ in
            self.notification.post = try? snapshot?.data(as: PostModel.self)
        }
    }
    
    func fetchNotificationUser() {
        COLLECTION_USERS.document(notification.uid).getDocument { snapshot, _ in
            self.notification.user = try? snapshot?.data(as: UserModel.self)
        }
    }
    
}
