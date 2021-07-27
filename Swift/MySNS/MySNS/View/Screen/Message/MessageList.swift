//
//  MessageList.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/26.
//

import SwiftUI

struct MessageList: View {
    @State var searchInput = ""
    @State var searchMode = false
    var body: some View {
        ScrollView {
            VStack {
                SearchTextField(input: $searchInput, searchMode: $searchMode)
                    .padding(.horizontal)
                    .padding(.top, 6)
                HStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                        .background(Color(.systemGray4))
                        .foregroundColor(.primary)
                        .cornerRadius(24)
                    LazyVStack(alignment: .leading) {
                        NavigationLink(
                            destination:
                                MessageView()
                                .navigationBarTitleDisplayMode(.inline).toolbar {
                                    ToolbarItem(placement: .principal) {
                                        HStack {
                                            Image(systemName: "person.fill")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 36, height: 36)
                                                .background(Color(.systemGray4))
                                                .foregroundColor(.primary)
                                                .cornerRadius(24)
                                            VStack {
                                                Text("USER ID")
                                                    .font(.system(size: 13, weight: .bold))
                                                    .foregroundColor(Color.gray)
                                                Text("메시지")
                                                    .font(.system(size: 15, weight: .bold))
                                            }
                                        }}},
                            label: {
                                VStack(alignment: .leading) {
                                    Text("USER ID")
                                        .font(.system(size: 15, weight: .semibold))
                                        .foregroundColor(.primary)
                                    Text("2일 전")
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                }
                                
                            })
                        NavigationLink(
                            destination: EmptyView(),
                            label: {
                                EmptyView()
                            })
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, 6)
                
            }
        }
    }
}

struct MessageList_Previews: PreviewProvider {
    static var previews: some View {
        MessageList()
    }
}
