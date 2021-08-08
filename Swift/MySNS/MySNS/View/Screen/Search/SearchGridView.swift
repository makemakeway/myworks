//
//  SearchGridView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI
import Kingfisher

struct SearchGridView: View {
    @StateObject var postGridViewModel: PostGridViewModel
    let config: PostGridConfiguration
    
    init(config: PostGridConfiguration) {
        self.config = config
        self._postGridViewModel = StateObject(wrappedValue: PostGridViewModel(config: config))
    }
    private let width = UIScreen.main.bounds.width / 3
    private let items = [GridItem(spacing: 0),
                         GridItem(spacing: 0),
                         GridItem(spacing: 0)]
    
    var body: some View {
        LazyVGrid(columns: items,
                  alignment: .center,
                  spacing: 0,
                  pinnedViews: [],
                  content: {
                    ForEach(postGridViewModel.posts) { post in
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
                                        }}},
                            label: { KFImage(URL(string: post.imageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: width, height: width)
                                .clipped()
                            })
                        
                    }
                  })
            
    }
}


