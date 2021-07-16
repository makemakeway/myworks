//
//  PostView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/16.
//

import SwiftUI

struct PostView: View {
    @State var postModel: PostModel
    @State var showActionSheet = false
    
    var body: some View {
        VStack(spacing:0) {
            
            // MARK: Header
            HStack {
                //Profile Image
                Image("SpiderMan")
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 30, height: 30)
                
                //Profile Name
                Text(postModel.displayName)
                    .font(.callout)
                    .foregroundColor(.primary)
                    .fontWeight(.medium)
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
                                        .destructive(Text("신고"), action: {  }),
                                        .default(Text("팔로우 취소"), action: {  }),
                                        .cancel(Text("취소"))
                                    ])
                    })
            }
            .padding(.all, 6)
            
            // MARK: Feed Image
            Image("Venom")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            
            
            
            // MARK: Footer
            
            HStack(spacing: 16) {
                //Like Button
                Image(systemName: "heart")
                
                //Comment Button
                Image(systemName: "bubble.right")
                
                //DM Button
                Image(systemName: "paperplane")
                
                Spacer()
                
                //BookMark Button
                Image(systemName: "bookmark")
            }
            .padding(.all, 6)
            .foregroundColor(.primary)
            .font(.title3)
            
            
            
            if let caption = postModel.caption {
                HStack {
                    Text(caption)
                    Spacer(minLength: 0)
                }
                .padding(.all, 6)
            }
            
            
        }
        //좋아요를 누른 사람이 2명 이상 있을 경우
    }
}


struct PostView_Previews: PreviewProvider {
    static var postModel: PostModel = PostModel(postID: "", userID: "", displayName: "Spider_man", caption: "이 포스트의 캡션이에요.", dateCreate: Date(), likeCount: 100, likedByCurrentUser: false)
    
    static var previews: some View {
        PostView(postModel: postModel)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
