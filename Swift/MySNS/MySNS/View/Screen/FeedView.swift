//
//  FeedView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/16.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject var posts: PostArrayObject
    
    var body: some View {
        
        ScrollView {
            VStack {
                LazyVStack {
                    ForEach(posts.dataArray, id:\.self) { data in
                        PostView(postModel: data)
                    }
                }
                
            }
        }
        .navigationBarItems(leading: Text("Feed")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.primary),
                            trailing: HStack(spacing: 18) {
                                Image(systemName: "plus.app")
                                Image(systemName: "heart")
                                Image(systemName: "paperplane")
                            }.foregroundColor(.primary).font(.title3))
        
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(posts: PostArrayObject())
        //            .preferredColorScheme(.dark)
    }
}
