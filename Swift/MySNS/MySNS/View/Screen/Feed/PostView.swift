//
//  PostView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/16.
//

import SwiftUI
import Kingfisher

struct PostView: View {
    @State var showActionSheet = false
    @ObservedObject var feedCellViewModel: FeedCellViewModel
    @ObservedObject var commentViewModel: CommentViewModel
    var didLiked: Bool { return feedCellViewModel.post.didLiked ?? false }
    
    init(viewModel: FeedCellViewModel) {
        self.feedCellViewModel = viewModel
        self.commentViewModel = CommentViewModel(post: viewModel.post)
    }
    
    var body: some View {
        VStack(spacing:0) {
            
            // MARK: Header
            HStack {
                //Profile Image
                if feedCellViewModel.post.ownerImageUrl.isEmpty {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .background(Color(.systemGray4))
                        .foregroundColor(.primary)
                        .cornerRadius(15)
                } else {
                    KFImage(URL(string: feedCellViewModel.post.ownerImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 30, height: 30)
                }
                
                
                //Profile Name
                Text(feedCellViewModel.post.ownerUserId)
                    .font(.callout)
                    .foregroundColor(.primary)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                
                Spacer()
                
                //ActionSheet Button
                Image(systemName: "ellipsis")
                    .font(.headline)
                    .foregroundColor(.primary)
                    .onTapGesture(perform: {
                        showActionSheet.toggle()
                    })
                    .actionSheet(isPresented: $showActionSheet, content: {
                        ActionSheet(title: Text(""),
                                    message: nil,
                                    buttons: [
                                        .default(Text("팔로우 취소"), action: {  }),
                                        .cancel(Text("취소"))
                                    ])
                    })
            }
            .padding(.all, 6)
            
            // MARK: Post Image
            KFImage(URL(string: feedCellViewModel.post.imageUrl))
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            
            
            
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
                Image(systemName: "paperplane")
                    .foregroundColor(.primary)
                
                Spacer()
                
                //BookMark Button
                Image(systemName: "bookmark")
                    .foregroundColor(.primary)
            }
            .padding(.all, 6)
            .font(.title3)
            
            // MARK: Like & Caption & Comment
            
            // Like
            if feedCellViewModel.post.likes > 0 {
                HStack {
                    (Text("좋아요 ") + Text("\(feedCellViewModel.post.likes)개"))
                        .foregroundColor(.primary)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding(.all, 6)
            }
                
            
            
            // Caption
            
                HStack {
                    Text(feedCellViewModel.post.ownerUserId).fontWeight(.semibold) + Text("  ") + Text(feedCellViewModel.post.caption)
                    Spacer(minLength: 0)
                }
                .padding(.all, 6)
            
            // Comment
            if commentViewModel.comments.count == 1 {
                HStack {
                    NavigationLink(
                        destination: CommentView(commentViewModel: commentViewModel),
                        label: {
                            Text("댓글 1개 보기")
                                .foregroundColor(.gray)
                                .font(.system(size: 14))
                        })
                    Spacer()
                }
                .padding(.leading, 6)
                
            } else if commentViewModel.comments.count >= 2 {
                HStack {
                    NavigationLink(
                        destination: CommentView(commentViewModel: commentViewModel),
                        label: {
                            Text("댓글 \(commentViewModel.comments.count)개 모두 보기")
                                .foregroundColor(.gray)
                                .font(.system(size: 14))
                        })
                    Spacer()
                }
                .padding(.leading, 6)
            }
            
            
            // TimeStamp
            HStack {
                Text("\(feedCellViewModel.post.timestamp)")
                Spacer()
            }
            .foregroundColor(.gray)
            .padding(.horizontal, 6)
            
            
            
        }
    }
}

