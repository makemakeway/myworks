//
//  UserCell.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/06/25.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        Button(action: {  }, label: {
            HStack {
                Image(systemName: "person.fill") // 프로필 이미지
                    .resizable()
                    .foregroundColor(.gray)
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .padding()
                    .border(Color.gray, width: 1)
                
                VStack(alignment: .leading) {
                    Text("User Name")           // 유저 이름
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text("Profile Message")     // 상태메세지
                        .font(.footnote)
                        .lineLimit(1)
                        .padding(.vertical, 5)
                        .foregroundColor(.gray)
                }
                .padding(.leading)

                Spacer()
            }
            .padding(.horizontal)
        })
        
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
