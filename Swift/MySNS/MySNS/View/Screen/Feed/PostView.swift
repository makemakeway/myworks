//
//  PostView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/16.
//

import SwiftUI
import Kingfisher

struct PostView: View {
    @StateObject var feedCellViewModel: FeedCellViewModel
    @StateObject var commentViewModel: CommentViewModel
    var post: PostModel
    var didLiked: Bool { return feedCellViewModel.post.didLiked ?? false }
    
    init(viewModel: FeedCellViewModel) {
        self._feedCellViewModel = StateObject(wrappedValue: FeedCellViewModel(post: viewModel.post))
        self._commentViewModel = StateObject(wrappedValue: CommentViewModel(post: viewModel.post))
        self.post = viewModel.post
    }
    
    var body: some View {
        VStack(spacing:0) {
            
            // MARK: Header
            HStack {
                //Profile Image
                
                if post.ownerImageUrl.isEmpty {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .background(Color(.systemGray4))
                        .foregroundColor(.primary)
                        .cornerRadius(15)
                } else {
                    KFImage(URL(string: post.ownerImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 30, height: 30)
                }
                
                
                //Profile Name
                Text(post.ownerUserId)
                    .font(.callout)
                    .foregroundColor(.primary)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Spacer()
                
            }
            .padding(.all, 6)
            
            // MARK: Post Image
            KFImage(URL(string: post.imageUrl))
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                .onTapGesture(count: 2) {
                    if post.didLiked == false {
                        feedCellViewModel.like()
                    }
                    else if post.didLiked == true {
                        feedCellViewModel.unlike()
                    }
                }
            
            
            // MARK: Footer
            
            HStack(spacing: 16) {
                //Like Button
                Button(action: { didLiked ? feedCellViewModel.unlike() : feedCellViewModel.like() },
                       label: {
                        Image(systemName: didLiked ? "heart.fill" : "heart")
                       })
                    .foregroundColor(didLiked ? .red : .primary)
                
                
                //Comment Button
                NavigationLink(
                    destination: CommentView(commentViewModel: commentViewModel),
                    label: {
                        Image(systemName: "bubble.right")
                            .foregroundColor(.primary)
                    })
                
                
                //DM Button
                NavigationLink (
                    destination: MessageView(user: UserModel(email: "", profileImageUrl: post.ownerImageUrl, id: post.ownerUid, userID: post.ownerUserId, userName: "")),
                    label: {
                        Image(systemName: "paperplane")
                            .foregroundColor(.primary)
                    }
                )
                
                
                
                Spacer()
                
            }
            .padding(.all, 6)
            .font(.title3)
            
            // MARK: Like & Caption & Comment
            
            // Like
            if feedCellViewModel.post.likes > 0 {
                HStack {
                    (Text("좋아요 ") + Text("\(post.likes)개"))
                        .foregroundColor(.primary)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding(.all, 6)
            }
            
            
            
            // Caption
            
            HStack {
                Text(post.ownerUserId).fontWeight(.semibold) + Text("  ") + Text(post.caption)
                Spacer(minLength: 0)
            }
            .padding(.all, 6)
            
            // Comment
            if commentViewModel.comments.count == 1 {
                HStack {
                    NavigationLink(
                        destination: CommentView(commentViewModel: commentViewModel),
                        label: {
                            Text("댓글 1개 보기...")
                                .foregroundColor(.gray)
                                .font(.system(size: 15))

                        })
                    Spacer()
                }
                .padding(.leading, 6)
                
            } else if commentViewModel.comments.count >= 2 {
                HStack {
                    NavigationLink(
                        destination: CommentView(commentViewModel: commentViewModel),
                        label: {
                            Text("댓글 \(commentViewModel.comments.count)개 모두 보기...")
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                        })
                    Spacer()
                }
                .padding(.leading, 6)
            }
            
            
            // TimeStamp
            HStack {
                Text("\(feedCellViewModel.timestampString)")
                    .font(.system(size: 14))
                Spacer()
            }
            .foregroundColor(.gray)
            .padding(.horizontal, 6)
            
            
            
            
        }
    }
}

