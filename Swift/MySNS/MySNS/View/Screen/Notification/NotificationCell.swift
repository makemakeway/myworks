//
//  NotificationCell.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    var isFollowed: Bool { return viewModel.notification.isFollowed ?? false }
    @ObservedObject var viewModel: NotificationCellViewModel
    
    init(viewModel: NotificationCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        HStack {
            if let user = viewModel.notification.user {
                NavigationLink(
                    destination: ProfileView(user: user, throughSearch: true).navigationBarTitle("\(user.userID)", displayMode: .inline),
                    label: {
                        if viewModel.notification.profileImageUrl.isEmpty {
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .background(Color(.systemGray4))
                                .foregroundColor(.primary)
                                .cornerRadius(20)
                        } else {
                            KFImage(URL(string: viewModel.notification.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .cornerRadius(20)
                        }
                        
                        
                        Text(viewModel.notification.userId)
                            .fontWeight(.semibold)
                            .font(.system(size: 14)) +
                            Text("\(viewModel.notification.type.notificationMessage)").font(.system(size: 15)) +
                            Text(" \(viewModel.notification.timestamp)").font(.system(size: 14)).foregroundColor(.gray)
                    })
            }
            
            
            
            
            
            
            Spacer()
            
            if viewModel.notification.type != .follow {
                if let post = viewModel.notification.post {
                    NavigationLink(
                        destination: PostView(viewModel: FeedCellViewModel(post: post))
                            .navigationBarTitleDisplayMode(.inline).toolbar {
                                ToolbarItem(placement: .principal) {
                                    VStack {
                                        Text("\(post.ownerUserId)")
                                            .font(.system(size: 13, weight: .bold))
                                            .foregroundColor(Color.gray)
                                        Text("게시물")
                                            .font(.system(size: 15, weight: .bold))
                                    }
                                    
                                }
                            },
                        label: {
                            KFImage(URL(string: post.imageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                        })
                    
                }
            } else {
                Button(action: { isFollowed ? viewModel.unfollow() : viewModel.follow() }, label: {
                    if isFollowed {
                        Text("팔로잉")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.primary)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.8))
                    }
                    else {
                        Text("팔로우")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .semibold))
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(Color(#colorLiteral(red: 0.1141172731, green: 0.541489393, blue: 1, alpha: 1)))
                    }
                    
                })
                
                
                .cornerRadius(7)
            }
            
        }
        
        .padding(.horizontal)
    }
}

