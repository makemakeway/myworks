//
//  AuthTextField.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/17.
//

import SwiftUI

struct AuthTextField: View {
    @Binding var input: String
    let placeholder: String
    let image: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            if input.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color(.systemGray5))
                    .padding(.leading, 50)
            }
            HStack(spacing: 14) {
                Image(systemName: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.systemGray5))
                
                TextField("", text: $input)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                Spacer()
            }
            .padding(.horizontal)
        }
        .frame(height: 40)
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white.opacity(0.3)))
    }
}
