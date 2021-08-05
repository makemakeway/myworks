//
//  MessageCell.swift
//  MySNS
//
//  Created by 박연배 on 2021/08/05.
//

import SwiftUI
import Kingfisher

struct MessageCell: View {
    let message: MessageModel
    
    var body: some View {
        HStack {
            if message.user.profileImageUrl.isEmpty {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .background(Color(.systemGray4))
                    .foregroundColor(.primary)
                    .cornerRadius(24)
            } else {
                KFImage(URL(string: message.user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .cornerRadius(24)
            }
            
            VStack(alignment: .leading) {
                Text(message.text)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray)
                    .clipShape(Capsule())
            }
            Spacer()
            
        }
        .padding()
    }
}

