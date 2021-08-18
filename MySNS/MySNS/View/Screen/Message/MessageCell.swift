//
//  MessageCell.swift
//  MySNS
//
//  Created by 박연배 on 2021/08/05.
//

import SwiftUI
import Kingfisher

struct MessageCell: View {
    let message: MessageModel
    
    
    var body: some View {
        HStack {
            if message.isCurrentUser {
                Spacer()
                
                Text(timestampString)
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
                    .padding(.leading, 80)
                    .padding(.trailing, 4)
                
                Text(message.text)
                    .foregroundColor(.primary)
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.8))

                
            } else {
                if message.user.profileImageUrl.isEmpty {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .background(Color(.systemGray4))
                        .foregroundColor(.primary)
                        .cornerRadius(24)
                } else {
                    KFImage(URL(string: message.user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .cornerRadius(24)
                }
                Text(message.text)
                    .foregroundColor(.primary)
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.8))
                    
                
                Text(timestampString)
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
                    .padding(.trailing, 80)
                    .padding(.leading, 8)
                
                
                Spacer()
            }
            
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
    var timestampString: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.timeStyle = .short
        
        return formatter.string(from: message.timestamp.dateValue())
        
    }
}

