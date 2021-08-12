//
//  NotificationViewModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/21.
//

import SwiftUI
import Firebase

class NotificationViewModel: ObservableObject {
    @Published var notifications = [NotificationModel]()
    init() {
        fetchNofitication()
    }
    
    static func uploadNofitication(toUid uid: String, type: NotificationType, post: PostModel? = nil) {
        
        guard let user = AuthViewModel.shared.currentUser else { return }
        guard uid != user.id else { return }
        
        
        var data:[String:Any] = ["timestamp": Timestamp(date: Date()),
                                 "userId": user.userID,
                                 "uid": user.id ?? "",
                                 "profileImageUrl": user.profileImageUrl,
                                 "type": type.rawValue
        ]
        if let post = post, let id = post.id {
            data["postId"] = id
        }
        
        COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").addDocument(data: data)
    }
    
    
    func fetchNofitication() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let query = COLLECTION_NOTIFICATIONS.document(uid).collection("user-notifications").order(by: "timestamp", descending: true)
        
        query.getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }

            self.notifications = documents.compactMap({ try? $0.data(as: NotificationModel.self) })
            
        }
        print("DEBUG: NotificationView init -> fetch Notification...")
        
    }
}
