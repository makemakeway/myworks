//
//  ProductCell.swift
//  GoodAsOldPhone
//
//  Created by 박연배 on 2021/06/10.
//

import SwiftUI

struct ProductCell1: View {
    var body: some View {
        HStack {
            Image("image-cell1")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
            
            Text("1907 Wall Set")
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

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell1()
    }
}
