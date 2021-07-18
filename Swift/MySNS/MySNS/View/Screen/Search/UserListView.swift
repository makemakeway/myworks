//
//  UserListView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI

struct UserListView: View {
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<50) { _ in
                    NavigationLink(
                        destination:
                            ProfileView(throughSearch: true)
                        ,
                        label: {
                            UserCell()
                        })
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
