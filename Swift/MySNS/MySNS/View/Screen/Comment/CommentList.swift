//
//  MessageView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/16.
//

import SwiftUI
import Kingfisher

struct CommentList: View {
    @ObservedObject var commentViewModel: CommentViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(commentViewModel.comments) { comment in
                    CommentCell(comment: comment)
                        
                        
                }
            }
        }
    }
}

