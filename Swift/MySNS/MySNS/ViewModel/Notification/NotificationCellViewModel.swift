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
        let dateFommat = ["s": "초 전", "m":"분 전", "h": "시간 전", "d": "일 전", "w": "주 전"]
        
        fommatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        fommatter.maximumUnitCount = 1
        fommatter.unitsStyle = .abbreviated
        let timestampString = fommatter.string(from: notification.timestamp.dateValue(), to: Date()) ?? ""
        let endIndex = timestampString.index(before: timestampString.endIndex)
        let dateValue = String(timestampString[..<endIndex])
        let dateInfo = String(timestampString[endIndex])
        return dateValue + (dateFommat[dateInfo] ?? "")
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
        print("DEBUG: NotificationCellViewModel init -> fetch NotificationPost...")
    }
    
    func fetchNotificationUser() {
        COLLECTION_USERS.document(notification.uid).getDocument { snapshot, _ in
            self.notification.user = try? snapshot?.data(as: UserModel.self)
        }
        print("DEBUG: NotificationCellViewModel init -> fetch NotificationUser...")
    }
    
}
