//
//  UserCell.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image("IronMan")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .cornerRadius(24)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Iron_Man")
                    .fontWeight(.semibold)
                Text("Robert.Jr")
                    .font(.system(size: 14))
            }
            .foregroundColor(.primary)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
