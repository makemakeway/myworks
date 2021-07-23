//
//  FeedViewModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/20.
//

import Firebase
import SwiftUI

class FeedViewModel: ObservableObject {
    @Published var posts = [PostModel]()
    
    init() {
        fetchPosts()
    }
    
    func fetchPosts() {
        COLLECTION_POSTS.order(by: "timestamp", descending: true).getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            self.posts = documents.compactMap({ try? $0.data(as: PostModel.self) })
            print("DEBUG: fetchposts")
        }
        
    }
}
