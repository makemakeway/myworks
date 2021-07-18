//
//  NotificationCell.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI

struct NotificationCell: View {
    @State private var showPostImage = false
    @State private var showFollowButton = true
    var body: some View {
        
        HStack {
            Image("IronMan")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .cornerRadius(20)
            
            Text("UserName")
                .fontWeight(.semibold)
                .font(.system(size: 14)) + Text(" ") + Text("caption").font(.system(size: 15))
            
            Spacer()
            
            if showPostImage {
                Image("IronMan")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            }
            
            if showFollowButton {
                Button(action: {  }, label: {
                    Text("팔로우")
                        .foregroundColor(.white)
                        .font(.system(size: 14, weight: .semibold))
                })
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .background(Color(#colorLiteral(red: 0.1141172731, green: 0.541489393, blue: 1, alpha: 1)))
                .cornerRadius(7)
            }
            
        }
        .padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
