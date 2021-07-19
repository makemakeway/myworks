//
//  User.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/17.
//

import FirebaseFirestoreSwift

struct UserModel: Identifiable, Decodable {
    let email: String
    let profileImageUrl: String
    @DocumentID var id: String?
    let userID: String
    let userName: String
    var isFollowed: Bool? = false
    
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
    
}
