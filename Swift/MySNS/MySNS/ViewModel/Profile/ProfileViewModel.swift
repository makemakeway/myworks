//
//  ProfileViewModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/19.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: UserModel
    
    init(user: UserModel) {
        self.user = user
        checkFollowed()
        fetchUserStats()
        fetchUserInfo()
    }
    
    func follow() {
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { _ in
            NotificationViewModel.uploadNofitication(toUid: uid, type: .follow)
            self.user.isFollowed = true
        }
        fetchUserStats()
//        fetchUserInfo()
    }
    
    func unfollow() {
        guard let uid = user.id else { return }
        UserService.unfollow(uid: uid) { _ in
            self.user.isFollowed = false
        }
        fetchUserStats()
//        fetchUserInfo()
    }
    
    func checkFollowed() {
        guard !user.isCurrentUser else { return }
        guard let uid = user.id else { return }
        UserService.checkFollow(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
        print("DEBUG: ProfileViewModel init -> check Followed...")
    }
    
    func fetchUserStats() {
        guard let uid = user.id else { return }
        COLLECTION_FOLLOWING.document(uid).collection("user-following").getDocuments { snapshot, _ in
            guard let following = snapshot?.documents.count else { return }
            COLLECTION_FOLLOWERS.document(uid).collection("user-followers").getDocuments { snapshot, _ in
                guard let followers = snapshot?.documents.count else { return }
                
                COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
                    guard let posts = snapshot?.documents.count else { return }
                    self.user.userStats = UserStats(following: following, followers: followers, posts: posts)
                    
                }
            }
        }
        print("DEBUG: ProfileViewModel init -> fetch UserStats...")
        
    }
    
    func fetchUserInfo() {
        guard let uid = user.id else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, _ in
            guard let data = try? snapshot?.data(as: UserModel.self) else { return }
            self.user = data
        }
        print("DEBUG: ProfileViewModel init -> fetch userinfo..")
    }
}
