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
    var action: () -> Void
    
    
    var body: some View {
        ZStack(alignment: .leading) {
            if input.isEmpty {
                Text(placeholder)
                    .foregroundColor(.gray)
                    .padding(.leading, 14)
            }
            HStack {
                TextField("", text: $input)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .padding(.leading, 14)
                
                Spacer()
                
                
                if onClicked {
                    Button(action: action) {
                        Text("게시")
                            .font(.callout)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.systemTeal))
                    }
                    .padding(.trailing, 14)
                }
                
            }
        }
        .frame(height: 40)
        .background(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 1))
    }
}

