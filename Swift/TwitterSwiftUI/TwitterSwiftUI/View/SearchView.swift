//
//  SearchView.swift
//  TwitterSwiftUI
//
//  Created by 박연배 on 2021/06/09.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    var body: some View {
        ScrollView{
            SearchBar(text: $searchText)
                .padding()
            VStack(alignment: .leading) {
                ForEach(0..<10) { _ in
                    HStack{Spacer()}
                    NavigationLink(
                        destination: UserProfileView(),
                        label: {
                            UserCell()
                        })
                }
            }
            .padding(.leading)
        }
        .navigationBarTitle("Search")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
