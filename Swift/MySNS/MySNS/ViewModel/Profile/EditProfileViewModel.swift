//
//  EditProfileViewModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/23.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    var user: UserModel
    var temp = [PostModel]()
    var tempComments = [CommentModel]()
    var tempNotifications = [NotificationModel]()

    @Published var uploadComplete = false
    
    init(user: UserModel) {
        self.user = user
    }

    
    func saveUserData(bio: String, userId: String, userName: String, image: UIImage?) {
        guard let uid = user.id else { return }
        self.user.bio = bio
        self.user.userID = userId
        self.user.userName = userName
        
        // USER 테이블 데이터 업데이트
        COLLECTION_USERS.document(uid).updateData(["bio":bio, "userID":userId, "userName":userName]) { _ in
            // 이미지 변경을 했을 경우
            
            if let image = image {
                self.UploadProfileImage(image: image) { _ in
                    print(self.user.profileImageUrl)
                    //포스트 userid, userProfileImage를 변경해주기위해 필요한 포스트들을 불러옴
                    COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
                        if let documents = snapshot?.documents {
                            self.temp = documents.compactMap({ try? $0.data(as: PostModel.self) })
                            self.temp.forEach { post in
                                guard let postId = post.id else { return }
                                // 포스트 정보를 가져온 뒤, 아이디와 프로필 이미지 URL을 변경
                                COLLECTION_POSTS.document(postId).updateData(["ownerUserId":userId, "ownerImageUrl":self.user.profileImageUrl])
                                AuthViewModel.shared.currentUser?.profileImageUrl = self.user.profileImageUrl
                                
                                // 코멘트 정보도 변경
                                COLLECTION_POSTS.document(postId).collection("post-comments").whereField("uid", isEqualTo: uid).getDocuments { snapshot, _ in
                                    guard let comments = snapshot?.documents else { return }
                                    self.tempComments = comments.compactMap({ try? $0.data(as: CommentModel.self) })
                                    self.tempComments.forEach { comment in
                                        guard let commentId = comment.id else { return }
                                        COLLECTION_POSTS.document(postId).collection("post-comments").document(commentId).updateData(["userName":self.user.userID, "profileImageUrl": self.user.profileImageUrl])
                                    }
                                }
                            }
                        }
                    }
                }
            }
            else {
                // 이미지 변경이 없을 경우, 아이디 변경만 기록
                COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
                    if let documents = snapshot?.documents {
                        self.temp = documents.compactMap({ try? $0.data(as: PostModel.self) })
                        self.temp.forEach { post in
                            guard let postId = post.id else { return }
                            COLLECTION_POSTS.document(postId).updateData(["ownerUserId":userId])
                            COLLECTION_POSTS.document(postId).collection("post-comments").whereField("uid", isEqualTo: uid).getDocuments { snapshot, _ in
                                guard let comments = snapshot?.documents else { return }
                                self.tempComments = comments.compactMap({ try? $0.data(as: CommentModel.self) })
                                self.tempComments.forEach { comment in
                                    guard let commentId = comment.id else { return }
                                    COLLECTION_POSTS.document(postId).collection("post-comments").document(commentId).updateData(["userName":self.user.userID])
                                }
                            }
                        }
                    }
                }
            }
            
            AuthViewModel.shared.currentUser?.bio = bio
            AuthViewModel.shared.currentUser?.userID = userId
            AuthViewModel.shared.currentUser?.userName = userName
            self.uploadComplete = true
        }
    }
    
    
    
    func UploadProfileImage(image: UIImage, completion: FireStoreCompletion) {
        guard let user = AuthViewModel.shared.currentUser else { return }
        
        ImageUploader.uploadImage(image: image, type: .profile) { imageUrl in
            guard let uid = user.id else { return }
            let data = ["profileImageUrl": imageUrl]
            self.user.profileImageUrl = imageUrl
            COLLECTION_USERS.document(uid).updateData(data)
            
        }
    }
    
    
}
