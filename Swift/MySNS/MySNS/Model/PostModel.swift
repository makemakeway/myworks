//
//  PostModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/16.
//

import Foundation
import SwiftUI

struct PostModel: Identifiable, Hashable {
    var id = UUID()
    
    var postID: String
    var userID: String
    var displayName: String
    var caption: String?
    var dateCreate: Date
    var likeCount: Int
    var likedByCurrentUser: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
}
