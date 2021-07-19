//
//  ProfileHeaderView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI
import Kingfisher

struct ProfileHeaderView: View {
    @ObservedObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        HStack {
            if profileViewModel.user.profileImageUrl.isEmpty {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .background(Color(.systemGray4))
                    .foregroundColor(.primary)
                    .cornerRadius(50)
            } else {
                KFImage(URL(string: profileViewModel.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(50)
            }

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
