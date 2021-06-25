//
//  SearchView.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/06/25.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    var body: some View {
        TextField("", text: $searchText)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: .constant("Hi"))
    }
}
