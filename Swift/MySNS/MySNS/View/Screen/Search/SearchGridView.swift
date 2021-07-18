//
//  SearchGridView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI

struct SearchGridView: View {
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
                    ForEach(0..<50) { i in
                        NavigationLink(
                            destination: FeedView(throughSearch: true),
                            label: {
                                Image("SpiderMan")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: width, height: width)
                                    .clipped()
                            })
                    }
                  })
    }
}

struct SearchGridView_Previews: PreviewProvider {
    static var previews: some View {
        SearchGridView()
    }
}
