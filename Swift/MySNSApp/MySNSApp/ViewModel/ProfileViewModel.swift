//
//  ProfileViewModel.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/07/11.
//

import Firebase

class ProfileViewModel: ObservableObject {
    let user: User
    @Published var isFollowed = false
    
    init(user: User) {
        self.user = user
    }
    
    func follow() {
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return
        }
        COLLECTION_FOLLOWING.document(currentUid).collection("user-following").document(user.id).setData([ : ]) { _ in
            COLLECTION_FOLLOWER.document(self.user.id).collection("user-follower").document(currentUid).setData([ : ]) { _ in
                self.isFollowed = true
            }
        }
    }
    
    func unfollow() {
        
    }
}
