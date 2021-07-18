//
//  ProfileHeaderView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        HStack {
            Image("SpiderMan")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(50)
            Spacer()
            UserStatView(value: 2, title: "게시물")
            Spacer()
            UserStatView(value: 5, title: "팔로워")
            Spacer()
            UserStatView(value: 6, title: "팔로잉")
            Spacer()
        }
        .padding()
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
