//
//  UserListView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI

struct UserListView: View {
    @StateObject var searchViewModel: SearchViewModel
    @Binding var searchInput: String
    
    
    var users: [UserModel] {
        return searchInput.isEmpty ? searchViewModel.users : searchViewModel.filteringUsers(query: searchInput)
    }
    
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(users, id:\.id) { user in
                    NavigationLink(
                        destination:
                            LazyView(ProfileView(user: user, throughSearch: true)),
                        label: {
                            UserCell(user: user)
                                
                        })
                    NavigationLink(
                        destination: EmptyView(),
                        label: {
                            EmptyView()
                        })
                }
            }
        }
//        .onAppear {
//            searchViewModel.fetchUsers()
//        }
    }
}

//struct UserListView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserListView()
//    }
//}
