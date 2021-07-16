//
//  PostArrayObject.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/16.
//

import Foundation

class PostArrayObject: ObservableObject {
    @Published var dataArray = [PostModel]()
    
    init() {
        let post1 = PostModel(postID: "", userID: "", displayName: "Spider_man", caption: "이 포스트의 캡션입니다.", dateCreate: Date(), likeCount: 0, likedByCurrentUser: false)
        let post2 = PostModel(postID: "", userID: "", displayName: "Venomiya", caption: "이 포스트의 캡션입니다.", dateCreate: Date(), likeCount: 0, likedByCurrentUser: false)
        let post3 = PostModel(postID: "", userID: "", displayName: "Iron_man", caption: "이 포스트의 캡션입니다.", dateCreate: Date(), likeCount: 0, likedByCurrentUser: false)
        let post4 = PostModel(postID: "", userID: "", displayName: "Black_pancher", caption: "이 포스트의 캡션입니다.", dateCreate: Date(), likeCount: 0, likedByCurrentUser: false)
        let post5 = PostModel(postID: "", userID: "", displayName: "Spider_man", caption: "이 포스트의 캡션입니다.", dateCreate: Date(), likeCount: 0, likedByCurrentUser: true)
        
        self.dataArray.append(post1)
        self.dataArray.append(post2)
        self.dataArray.append(post3)
        self.dataArray.append(post4)
        self.dataArray.append(post5)
    }
}
