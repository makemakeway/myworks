//
//  SearchView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI

struct SearchView: View {
    @State var searchInput = ""
    @State var searchMode = false
    private let width = UIScreen.main.bounds.width / 4
    var body: some View {
        ScrollView {
            VStack {
                SearchTextField(input: $searchInput, searchMode: $searchMode)
                    .padding(.horizontal)
                
                
                if searchMode {
                    UserListView()
                } else {
                    SearchGridView()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
        //            .preferredColorScheme(.dark)
    }
}
