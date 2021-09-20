//
//  SearchBar.swift
//  CandySearchSwiftUI
//
//  Created by 박연배 on 2021/06/21.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    @Binding var searchBarTapped: Bool
    var body: some View {
        HStack {
            HStack {
                TextField("Search", text: $searchText)
                    .padding(.leading)
                
            }
            .padding(14)
            .background(Color(.systemGray3))
            .cornerRadius(14.0)
            .padding(.horizontal)
            .onTapGesture(perform: {
                searchBarTapped = true
            })
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(.systemGray5))
                    Spacer()
                }
                .padding(.horizontal, 24)
            )
            if searchBarTapped {
                Button(action: { searchBarTapped = false }, label: {
                    Text("Cancel")
//                        .foregroundColor(.white)
                        .padding(.trailing, 18)
                        .padding(.leading, 0)
                })
                .transition(.move(edge: .trailing))
                .animation(.spring())
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchText: .constant(""), searchBarTapped: .constant(true))
    }
}
