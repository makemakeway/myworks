//
//  CommentModel.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/16.
//

import Foundation
import SwiftUI

struct CommentModel: Identifiable, Hashable {
    
    var id = UUID()
    var commentID: String
    var userID: String
    var userName: String
    var content: String
    var dateCreated: Date
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
