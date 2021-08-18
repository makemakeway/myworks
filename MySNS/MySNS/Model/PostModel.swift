//
//  PostModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/16.
//

import FirebaseFirestoreSwift
import Firebase

struct PostModel: Identifiable, Decodable {
    @DocumentID var id: String?
    let ownerUid: String
    var ownerUserId: String
    let caption: String
    var likes: Int
    var imageUrl: String
    let timestamp: Timestamp
    var ownerImageUrl: String
    
    var didLiked: Bool? = false
}
