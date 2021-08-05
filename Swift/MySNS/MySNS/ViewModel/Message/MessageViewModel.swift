//
//  MessageViewModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/27.
//

import SwiftUI
import Firebase

struct MessageViewModel {
    var messages = [MessageModel]()
    let user: UserModel
    
    init(user: UserModel) {
        self.user = user
    }
    
    func sendMessage(content: String) {
        guard let uid = user.id else { return }
        guard let currentUid = AuthViewModel.shared.currentUser?.id else { return }
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
    
    func fetchMessages() {
        
    }
}
