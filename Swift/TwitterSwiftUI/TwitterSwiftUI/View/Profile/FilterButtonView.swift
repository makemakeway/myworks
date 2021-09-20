//
//  FilterButtonView.swift
//  TwitterSwiftUI
//
//  Created by 박연배 on 2021/06/11.
//

import SwiftUI

enum TwitterFilterOptions: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        
        case .tweets: return "Tweets"
        case .replies: return "Tweets & Replies"
        case .likes: return "Likes"
        }
    }
}

struct FilterButtonView: View {
    @Binding var selectedOption: TwitterFilterOptions
    
    private let underlineWidth = UIScreen.main.bounds.width /
        CGFloat(TwitterFilterOptions.allCases.count)
    
    private var padding: CGFloat {
        var rawValue = CGFloat(selectedOption.rawValue)
        var count = CGFloat(TwitterFilterOptions.allCases.count)
        return ((UIScreen.main.bounds.width / count) * rawValue) + 16
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(TwitterFilterOptions.allCases, id: \.self) {
                    option in
                    Button(action: {
                        self.selectedOption = option
                    }, label: {
                        Text(option.title)
                            .frame(width: underlineWidth - 8)
                    })
                }
            }
            Rectangle()
                .frame(width: underlineWidth - 32, height: 3, alignment: .center)
                .foregroundColor(.blue)
                .padding(.leading, padding)
                .animation(.spring())
        }
    }
}

struct FilterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FilterButtonView(selectedOption: .constant(.tweets))
    }
}
