//
//  PostGridViewModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/20.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

enum PostGridConfiguration {
    // 검색창 그리드
    case explore
    
    // 프로필 그리드(String에는 uid가 들어감)
    case profile(String)
}

class PostGridViewModel: ObservableObject {
    
    @Published var posts = [PostModel]()
    let config: PostGridConfiguration
    
    init(config: PostGridConfiguration) {
        self.config = config
        fetchPosts(forConfig: config)
    }
    
    func fetchPosts(forConfig config: PostGridConfiguration) {
        switch config {
        case .explore:
            fetchExplorePosts()
        case .profile(let uid):
            fetchUserPost(forUid: uid)
        }
    }
    
    func fetchExplorePosts() {
        COLLECTION_POSTS.order(by: "timestamp", descending: true).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: PostModel.self) })
        }
        
    }
    
    func fetchUserPost(forUid uid: String) {
        COLLECTION_POSTS.whereField("ownerUid", isEqualTo: uid).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let posts = documents.compactMap({ try? $0.data(as: PostModel.self) })
            self.posts = posts.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
            
        }
    }
    
}


