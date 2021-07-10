//
//  User.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/07/10.
//

import Foundation

struct User: Identifiable {
    let email: String
    let profileImageUrl: String
    let profileMessage: String
    let id: String
    let username: String
    
    init(dictionary: [String : Any]) {
        self.id = dictionary["uid"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String ?? ""
        self.profileMessage = dictionary["profileMessage"] as? String ?? ""
        self.username = dictionary["userName"] as? String ?? ""
    }
}
