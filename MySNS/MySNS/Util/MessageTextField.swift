//
//  MessageTextField.swift
//  MySNS
//
//  Created by 박연배 on 2021/08/03.
//

import SwiftUI

struct MessageTextField: View {
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
                        Text("보내기")
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
