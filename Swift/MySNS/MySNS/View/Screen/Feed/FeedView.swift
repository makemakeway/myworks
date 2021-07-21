//
//  FeedView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/16.
//

import SwiftUI
import PhotosUI

struct FeedView: View {
    @Environment(\.presentationMode) var mode
    @State var throughSearch = false
    @State var addPostButtonClicked = false
    @ObservedObject var feedViewModel = FeedViewModel()
    
    var body: some View {
        
        ScrollView {
            
            LazyVStack(spacing: 32) {
                ForEach(feedViewModel.posts) { post in
                    PostView(viewModel: FeedCellViewModel(post: post))
                }
            }
            .padding(.top)
            
            // MARK: 네비게이션 바 렌더링 파트
            if throughSearch {
                EmptyView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle("탐색 탭", displayMode: .inline)
                    .navigationBarItems(leading: Button(action:
                                                            {
                                                                mode.wrappedValue.dismiss()
                                                                throughSearch = false
                                                            },
                                                        label: {
                                                            Image(systemName: "chevron.left")
                                                                .foregroundColor(.primary)
                                                        }))
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
                                            Image(systemName: "paperplane")
                                        }.foregroundColor(.primary).font(.title3))
                    .fullScreenCover(isPresented: $addPostButtonClicked, content: {
                        UploadPostView()
                    })
            }
        }
        
    }
}

