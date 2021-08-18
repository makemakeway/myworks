//
//  MessageViewModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/27.
//

import SwiftUI
import Firebase

class MessageViewModel: ObservableObject {
    @Published var messages = [MessageModel]()
    let user: UserModel
    
    
    
    init(user: UserModel) {
        self.user = user
        fetchMessages(user: user)
    }

    func sendMessage(content: String) {
        guard let uid = user.id else { return }
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        let currentUserRef = COLLECTION_MESSAGES.document(currentUid).collection(uid).document()
        let currentRecentRef = COLLECTION_MESSAGES.document(currentUid).collection("recent-messages")
        let opponentUserRef = COLLECTION_MESSAGES.document(uid).collection(currentUid)
        let oppenentRecentRef = COLLECTION_MESSAGES.document(uid).collection("recent-messages")
        let messageID = currentUserRef.documentID
        
        let data: [String:Any] = ["text":content,
                                  "id":messageID,
                                  "fromId":currentUid,
                                  "toId":uid,
                                  "timestamp":Timestamp(date: Date())]
        
        currentUserRef.setData(data)
        currentRecentRef.document(uid).setData(data)
        opponentUserRef.document(messageID).setData(data)
        oppenentRecentRef.document(currentUid).setData(data)
    }
    
    func fetchMessages(user: UserModel) {
        guard let uid = user.id else { return }
        guard let currentUid = AuthViewModel.shared.userSession?.uid else { return }
        let query = COLLECTION_MESSAGES.document(currentUid).collection(uid)
        
        query.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            changes.forEach { change in
                
                let message = change.document.data()
                guard let fromId = message["fromId"] as? String else { return }
                
                COLLECTION_USERS.document(fromId).getDocument { snapshot, _ in
                    let data = try? snapshot?.data(as: UserModel.self)
                    guard let email = data?.email else { return }
                    guard let profileImageUrl = data?.profileImageUrl else { return }
                    guard let userId = data?.userID else { return }
                    guard let userName = data?.userName else { return }
                    let user = UserModel(email: email, profileImageUrl: profileImageUrl, userID: userId, userName: userName)
                    
                    self.messages.append(MessageModel(user: user, dictionary: message))
                    self.messages.sort(by: { $0.timestamp.dateValue() < $1.timestamp.dateValue() })
                }
            }
        }
    }
}
