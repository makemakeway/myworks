//
//  UserCell.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/06/25.
//

import SwiftUI

struct UserCell: View {
//    @Binding var profiles: [Profile]
    
    
    var body: some View {
        Button(action: {  }, label: {
            HStack {
                Image(systemName: "person.fill") // 프로필 이미지
                    .resizable()
                    .frame(width: 30, height: 30)
                    .scaledToFit()
                    .padding()
                    .background(Color(.systemTeal))
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    
                    
                    
                
                VStack(alignment: .leading) {
                    Text("userName")           // 유저 이름
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.white))
                        .padding(.top, 15)
                        
                    
                    Text("profileMessage")     // 상태메세지
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
            .preferredColorScheme(.dark)
    }
}
