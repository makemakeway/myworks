//
//  UserCell.swift
//  TwitterSwiftUI
//
//  Created by 박연배 on 2021/06/09.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(spacing: 12) {
            Image("venom-10")
                .resizable()
                .scaledToFit()
                .clipped()
                .frame(width:56, height: 56)
                .cornerRadius(56 / 2)
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("venom")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("Eddie Brock")
                    .font(.system(size: 14))
            }
            .foregroundColor(.black)
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
