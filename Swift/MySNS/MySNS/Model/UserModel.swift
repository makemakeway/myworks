//
//  User.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/17.
//

import FirebaseFirestoreSwift
import Firebase

struct UserModel: Identifiable, Decodable {
    var email: String
    var profileImageUrl: String
    @DocumentID var id: String?
    var userID: String
    var userName: String
    var userStats: UserStats?
    var isFollowed: Bool? = false
    var bio: String?
    var isCurrentUser: Bool { return AuthViewModel.shared.userSession?.uid == id }
    var ownedPost: String?
    
}

struct UserStats: Decodable {
    var following: Int
    var followers: Int
    var posts: Int
}
