//
//  CustomTextField.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/16.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var input: String
    @Binding var onClicked: Bool
    let placeholder: String
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            if input.isEmpty {
                Text(placeholder)
                    .foregroundColor(.gray)
                    .padding(.leading, 14)
            }
            HStack {
                TextField("", text: $input)
                    .padding(.leading, 14)
                
                Spacer()
                
                Button(action: {}, label: {
                    Text("게시")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemTeal))
                })
                .padding(.trailing, 14)
            }
        }
        .frame(height: 40)
        .background(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 1))
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(input: .constant("딸랄랄"), onClicked: .constant(true), placeholder: "댓글 달기...")
    }
}
