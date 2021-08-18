//
//  SearchTextField.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI

struct SearchTextField: View {
    @Binding var input: String
    @Binding var searchMode: Bool
    
    var body: some View {
        HStack {
            TextField("검색", text: $input)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray4))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                )
                .onTapGesture {
                    searchMode = true
                }
            if searchMode {
                Button(action: {
                    searchMode = false
                    input = ""
                    UIApplication.shared.endEditing()
                    
                },
                label: {
                    Text("취소")
                })
                .foregroundColor(.primary)
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
                .animation(.easeInOut)
            }
        }
    }
}


struct SearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextField(input: .constant(""), searchMode: .constant(true))
    }
}
