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
    
    var timestampString: String? {
        let fommatter = DateComponentsFormatter()
        fommatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        fommatter.maximumUnitCount = 1
        fommatter.unitsStyle = .abbreviated
        return fommatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
    }
    
}
