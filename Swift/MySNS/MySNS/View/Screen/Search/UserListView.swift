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
                            ProfileView(user: user, throughSearch: true).navigationBarTitle("\(user.userID)", displayMode: .inline)
                            
                        ,
                        label: {
                            UserCell(user: user)
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
