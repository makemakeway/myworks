//
//  SearchView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var searchViewModel = SearchViewModel()
    @State var searchInput = ""
    @State var searchMode = false
    var body: some View {
        ScrollView {
            VStack {
                SearchTextField(input: $searchInput, searchMode: $searchMode)
                    .padding(.horizontal)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                
                if searchMode {
                    UserListView(searchViewModel: searchViewModel, searchInput: $searchInput)
                } else {
                    SearchGridView(config: .explore)
                }
            }
            .navigationBarHidden(true)
            .onAppear(perform: {
                searchViewModel.fetchUsers()
            })
        }
    }
}


