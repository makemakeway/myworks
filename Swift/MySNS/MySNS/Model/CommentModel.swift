//
//  CommentModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/20.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct CommentModel: Identifiable, Decodable {
    
    @DocumentID var id: String?
    var uid: String
    var postOwnerUid: String
    var profileImageUrl: String
    var userName: String
    var commentText: String
    var timestamp: Timestamp
    
    
    
}
