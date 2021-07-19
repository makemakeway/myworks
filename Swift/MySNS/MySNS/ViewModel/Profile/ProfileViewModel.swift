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
    }
    
    func follow() {
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { _ in
            self.user.isFollowed = true
        }
    }
    
    func unfollow() {
        guard let uid = user.id else { return }
        UserService.unfollow(uid: uid) { _ in
            self.user.isFollowed = false
        }
        
    }
    
    func checkFollowed() {
        guard !user.isCurrentUser else { return }
        guard let uid = user.id else { return }
        UserService.checkFollow(uid: uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
    
}
