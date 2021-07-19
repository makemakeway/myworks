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
    @State var throughSearch = true
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(searchInput.isEmpty ? searchViewModel.users : searchViewModel.filteringUsers(query: searchInput)) { user in
                    NavigationLink(
                        destination:
                            ProfileView(user: user, throughSearch: true)
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
