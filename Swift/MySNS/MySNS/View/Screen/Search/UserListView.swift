//
//  UserListView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var searchViewModel: SearchViewModel
    @Binding var searchInput: String
    
    
    var users: [UserModel] {
        return searchInput.isEmpty ? searchViewModel.users : searchViewModel.filteringUsers(query: searchInput)
    }
    
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(users) { user in
                    NavigationLink(
                        destination:
                            LazyView(ProfileView(user: user, throughSearch: true)),
                        label: {
                            UserCell(user: user)
                                .onAppear {
                                    searchViewModel.fetchUsers()
                                }
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

//struct UserListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserListView()
//    }
//}
