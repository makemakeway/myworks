//
//  NotificationCell.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    @State private var showPostImage = false
    @State private var showFollowButton = true
    
    let notification: NotificationModel
    var body: some View {
        
        HStack {
            if notification.profileImageUrl.isEmpty {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .background(Color(.systemGray4))
                    .foregroundColor(.primary)
                    .cornerRadius(20)
            } else {
                KFImage(URL(string: notification.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .cornerRadius(20)
            }
            
            
            Text(notification.userId)
                .fontWeight(.semibold)
                .font(.system(size: 14)) +
                Text("\(notification.type.notificationMessage)").font(.system(size: 15)) +
                Text(" \(notification.timestamp)").font(.system(size: 14)).foregroundColor(.gray)
            
            Spacer()
            
            if notification.type != .follow {
                KFImage(URL(string: notification.profileImageUrl)) // change to postimageurl
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            } else {
                Button(action: {  }, label: {
                    Text("팔로우")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                })
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .background(Color(#colorLiteral(red: 0.1141172731, green: 0.541489393, blue: 1, alpha: 1)))
                .cornerRadius(7)
            }
            
        }
        .padding(.horizontal)
    }
}

