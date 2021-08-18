//
//  CommentCell.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/21.
//

import SwiftUI
import Kingfisher

struct CommentCell: View {
    let comment: CommentModel
    var body: some View {
        HStack {
            if comment.profileImageUrl.isEmpty {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .background(Color(.systemGray4))
                    .foregroundColor(.primary)
                    .cornerRadius(20)
            } else {
                KFImage(URL(string: comment.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .cornerRadius(20)
            }
            
            Text("\(comment.userName)").font(.system(size: 14, weight: .semibold)) + Text(" \(comment.commentText)").font(.system(size: 14))
            
            Spacer()
            
            if let timeString = comment.timestampString {
                Text("\(timeString)")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
            }
            
        }
        .padding([.top, .horizontal])
    }
}

