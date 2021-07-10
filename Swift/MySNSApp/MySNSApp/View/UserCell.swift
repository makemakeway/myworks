//
//  UserCell.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/06/25.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    //    @Binding var profiles: [Profile]
    let user: User
    
    var body: some View {
        HStack {
            KFImage(URL(string: user.profileImageUrl)) // 프로필 이미지
                .resizable()
                .foregroundColor(.white)
                .scaledToFill()
                .frame(width: 70, height: 70)
                .cornerRadius(23)
            
            
            
            
            VStack(alignment: .leading) {
                Text(user.username)           // 유저 이름
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.top, 5)
                
                
                Text(user.profileMessage)     // 상태메세지
                    .font(.footnote)
                    .lineLimit(1)
                    .padding(.top, 1)
                    .padding(.bottom, 1)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 10)
            
            
            Spacer()
        }
        .padding(.horizontal)
        
        
    }
}
