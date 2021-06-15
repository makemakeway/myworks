//
//  ProfileCell.swift
//  FaceBookMeSwiftUI
//
//  Created by 박연배 on 2021/06/15.
//

import SwiftUI

struct ProfileCell: View {
    var body: some View {
        HStack(spacing: 16) {
            Image("bayMax")
                .resizable()
                .scaledToFit()
                .frame(width: 76, height: 76)
            VStack(alignment:.leading, spacing: 6) {
                Text("BayMax")
                    .font(.title3)
                Text("View your profile")
                    .font(.footnote)
            }
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "chevron.right")
            })
            .foregroundColor(Color(.systemGray2))
            .frame(width: 20, height: 20)
        }
        .padding(.horizontal)
    }
}

struct ProfileCell_Previews: PreviewProvider {
    static var previews: some View {
        ProfileCell()
    }
}
