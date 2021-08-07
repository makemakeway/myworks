//
//  MessageList.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/26.
//

import SwiftUI
import Kingfisher

struct MessageList: View {
    @State var searchInput = ""
    @State var searchMode = false
    @ObservedObject var viewModel = MessageListViewModel()
    @ObservedObject var searchViewModel = SearchViewModel()
    
    
    var body: some View {
        ScrollView {
            VStack {
                SearchTextField(input: $searchInput, searchMode: $searchMode)
                    .padding(.horizontal)
                    .padding(.top, 6)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                if searchMode {
                    UserListView(searchViewModel: searchViewModel, searchInput: $searchInput)
                } else {
                    LazyVStack(alignment: .leading) {
                        ForEach(viewModel.messages) { message in
                            NavigationLink(
                                destination:
                                    MessageView(user: message.user),
                                label: {
                                    HStack {
                                        if message.user.profileImageUrl.isEmpty {
                                            Image(systemName: "person.fill")
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 48, height: 48)
                                                .background(Color(.systemGray4))
                                                .foregroundColor(.primary)
                                                .cornerRadius(24)
                                        } else {
                                            KFImage(URL(string: message.user.profileImageUrl))
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 48, height: 48)
                                                .cornerRadius(24)
                                        }
                                        
                                        
                                        VStack(alignment: .leading) {
                                            Text(message.user.userID)
                                                .font(.system(size: 15, weight: .semibold))
                                                .foregroundColor(.primary)
                                            Text(message.text)
                                                .font(.system(size: 14))
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    .padding(.horizontal)
                                    .padding(.vertical, 6)
                                })
                            NavigationLink(
                                destination: EmptyView(),
                                label: {
                                    EmptyView()
                                })
                        }
                        
                    }
                    
                }
            }
        }

    }
}

