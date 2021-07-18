//
//  User.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/17.
//

import SwiftUI
import Firebase

struct User: Identifiable {
    var email: String
    var userID: String
    let id: String
    var userName: String
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == self.id }
    var imageUrl: String
    
    init(dictionary: [String : Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.userID = dictionary["userID"] as? String ?? ""
        self.userName = dictionary["userName"] as? String ?? ""
        self.imageUrl = dictionary["imageUrl"] as? String ?? ""
    }
}
