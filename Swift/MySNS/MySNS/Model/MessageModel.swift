//
//  MessageModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/27.
//

import SwiftUI
import Firebase

struct MessageModel: Identifiable {
    var id: String
    var fromUid: String
    var toUid: String
    var isCurrentUser: Bool
    var text: String
    var user: UserModel
    var timestamp: Timestamp
    
    
    var opponentId: String { return isCurrentUser ? toUid : fromUid }
    
    init(user: UserModel, dictionary: [String:Any]) {
        self.user = user
        self.text = dictionary["text"] as? String ?? ""
        self.toUid = dictionary["toId"] as? String ?? ""
        self.fromUid = dictionary["fromId"] as? String ?? ""
        self.id = dictionary["id"] as? String ?? ""
        self.isCurrentUser = fromUid == AuthViewModel.shared.currentUser?.id
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
    }
    
}
