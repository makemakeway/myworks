//
//  ContentView.swift
//  CandySearchSwiftUI
//
//  Created by 박연배 on 2021/06/21.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    @State var searchBarTapped = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    HStack {
    //                    SearchBar(searchText: $searchText, searchBarTapped: $searchBarTapped)
                    }
                    
                    ForEach((0..<20).filter({ "\($0)".contains(searchText) || searchText.isEmpty }), id: \.self) { num in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(num)")
                                    .font(.title2)
                                Text("what kind of this?")
                                    .font(.footnote)
                            }
                            .padding(.horizontal)
                            Spacer()
                        }
                        Divider()
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(trailing: Image("Inline-logo"))
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
