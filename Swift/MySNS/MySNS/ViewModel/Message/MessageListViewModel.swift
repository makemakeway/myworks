//
//  MessageListViewModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/27.
//

import SwiftUI
import Firebase

class MessageListViewModel: ObservableObject {
    @Published var messages = [MessageModel]()
    private var recentDictionary = [String : MessageModel]()
    
    
    init() {
        fetchMessages()
    }
    
    func fetchMessages() {
        guard let uid = AuthViewModel.shared.userSession?.uid else { return }
        let query = COLLECTION_MESSAGES.document(uid).collection("recent-messages")
        
        query.addSnapshotListener { snapshot, error in
            guard let changes = snapshot?.documentChanges else { return }
            changes.forEach { change in
                let uid = change.document.documentID
                let message = change.document.data()
                
                COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
                    let data = try? snapshot?.data(as: UserModel.self)
                    guard let email = data?.email else { return }
                    guard let profileImageUrl = data?.profileImageUrl else { return }
                    guard let userId = data?.userID else { return }
                    guard let userName = data?.userName else { return }
                    guard let uid = data?.id else { return }
                    let user = UserModel(email: email, profileImageUrl: profileImageUrl, id: uid, userID: userId, userName: userName)
                    self.recentDictionary[uid] = MessageModel(user: user, dictionary: message)
                    
                    self.messages = Array(self.recentDictionary.values)
                    self.messages.sort(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
                    print("DEBUG: recentmessages \(self.recentDictionary)")
                }
            }
        }
    }
    
}
