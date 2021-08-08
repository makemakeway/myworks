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
        let dateFommat = ["s": "초 전", "m":"분 전", "h": "시간 전", "d": "일 전", "w": "주 전"]
        
        fommatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        fommatter.maximumUnitCount = 1
        fommatter.unitsStyle = .abbreviated
        let timestampString = fommatter.string(from: timestamp.dateValue(), to: Date()) ?? ""
        let endIndex = timestampString.index(before: timestampString.endIndex)
        let dateValue = String(timestampString[..<endIndex])
        let dateInfo = String(timestampString[endIndex])
        return dateValue + (dateFommat[dateInfo] ?? "")
    }
    
}
