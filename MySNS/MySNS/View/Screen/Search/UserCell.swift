//
//  UserCell.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    let user: UserModel
    var body: some View {
        HStack {
            if user.profileImageUrl.isEmpty {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .background(Color(.systemGray4))
                    .foregroundColor(.primary)
                    .cornerRadius(24)
            } else {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .cornerRadius(24)
            }
            
            
            VStack(alignment: .leading, spacing: 6) {
                Text("\(user.userID)")
                    .fontWeight(.semibold)
                Text("\(user.userName)")
                    .font(.system(size: 14))
            }
            .foregroundColor(.primary)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

//struct UserCell_Previews: PreviewProvider {
//    static var previews: some View {
//        UserCell()
//    }
//}
