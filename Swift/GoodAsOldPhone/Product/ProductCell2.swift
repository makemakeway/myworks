//
//  ProductCell2.swift
//  GoodAsOldPhone
//
//  Created by 박연배 on 2021/06/11.
//

import SwiftUI

struct ProductCell2: View {
    var body: some View {
        HStack {
            Image("image-cell2")
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
            
            Text("1921 Dial Phone")
                .font(.title2)
                .fontWeight(.medium)
                .padding(.horizontal)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(Color.gray)
                .padding(.trailing)
        }
        .padding(.leading)
    }
}

struct ProductCell2_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell2()
    }
}
