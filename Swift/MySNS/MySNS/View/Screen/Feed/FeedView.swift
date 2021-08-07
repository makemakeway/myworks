//
//  FeedView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/16.
//

import SwiftUI
import PhotosUI

struct FeedView: View {
    var throughSearch: Bool = false
    @State private var addPostButtonClicked = false
    @ObservedObject var feedViewModel: FeedViewModel
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false, content: {
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                
                
                LazyVStack(spacing: 32) {
                    ForEach(feedViewModel.posts) { post in
                        PostView(viewModel: FeedCellViewModel(post: post))
                    }
                }
                .padding(.top)
                
            }
            
            // MARK: 네비게이션 바 렌더링 파트
            if throughSearch {
                EmptyView()
                    .navigationBarTitle("탐색 탭", displayMode: .inline)
            }
            else {
                EmptyView()
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarItems(leading: Text("Feed")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.primary),
                                        trailing: HStack(spacing: 18) {
                                            // 새 게시물 올리기 창으로 이동
                                            Button(action: { addPostButtonClicked = true }, label: {
                                                Image(systemName: "plus.app")
                                            })
                                            // 알림창으로 이동
                                            NavigationLink(
                                                destination: NotificationView(),
                                                label: {
                                                    Image(systemName: "heart")
                                                })
                                            // 메시지창으로 이동
                                            NavigationLink(
                                                destination: MessageList().navigationBarTitle("메시지", displayMode: .inline),
                                                label: {
                                                    Image(systemName: "paperplane")
                                                })
                                            
                                        }.foregroundColor(.primary).font(.title3))
                    .fullScreenCover(isPresented: $addPostButtonClicked, content: {
                        UploadPostView()
                    })
            }
        })
//        .onAppear {
//            DispatchQueue.global().sync {
//                feedViewModel.refreshPost()
//            }
//        }
        
    }
}

