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
            
            GeometryReader { reader -> AnyView in

//                DispatchQueue.main.async {
//                    if refresh.startOffset == 0 {
//                        refresh.startOffset = reader.frame(in: .global).minY
//                    }
//
//                    refresh.offset = reader.frame(in: .global).minY
//
//                    if refresh.offset - refresh.startOffset > 80 && !refresh.started{
//                        refresh.started = true
//                    }
//
//                    if refresh.startOffset == refresh.offset && refresh.started && !refresh.released {
//                        refresh.released = true
//                        feedViewModel.fetchPosts()
//                        refresh.released = false
//                        refresh.started = false
//                    }
//
//                }

                return AnyView(Color.black.frame(width: 0, height: 0))
            }
            .frame(width: 0, height: 0)
            
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
                                            Button(action: { addPostButtonClicked = true }, label: {
                                                Image(systemName: "plus.app")
                                            })
                                            NavigationLink(
                                                destination: NotificationView(),
                                                label: {
                                                    Image(systemName: "heart")
                                                })
                                            NavigationLink(
                                                destination: MessageList(),
                                                label: {
                                                    Image(systemName: "paperplane")
                                                })
                                            
                                        }.foregroundColor(.primary).font(.title3))
                    .fullScreenCover(isPresented: $addPostButtonClicked, content: {
                        UploadPostView()
                    })
            }
        })
        .onAppear {
            DispatchQueue.global().sync {
                feedViewModel.fetchPosts()
            }
        }
        
    }
}

struct Refresh {
    var startOffset: CGFloat = 0
    var offset: CGFloat = 0
    var started: Bool
    var released: Bool
}

