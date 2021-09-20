//
//  FeedCell.swift
//  LocalSNSApp
//
//  Created by 박연배 on 2021/08/16.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "house")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .background(Color.blue)
                .cornerRadius(10)
                
            VStack(alignment: .leading) {
                Text("이름")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.primary)
                
                HStack {
                    Text("동이름")
                    Text("시간")
                }
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.gray)
                
                Text("가격")
                    .padding(.vertical, 8)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.primary)
                
                Spacer()
                
                HStack(alignment:.lastTextBaseline, spacing: 4) {
                    Spacer()
                    Image(systemName: "bubble.right")
                    Text("1")
                    
                    Image(systemName: "heart")
                    Text("2")
                }
                .foregroundColor(.gray)
                .font(.system(size: 14, weight: .medium))
            }
            .frame(height: 120)
            .padding(.horizontal, 8)
            Spacer()
        }
        .padding(.all, 12)
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
