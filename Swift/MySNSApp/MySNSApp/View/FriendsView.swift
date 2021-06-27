//
//  FriendsView.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/06/25.
//

import SwiftUI

struct FriendsView: View {
    @State var searchBarInput = ""
    @State var searchBarClicked = false
    @State var searchToggle = false
    @State var profile = [Profile]()
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    VStack {
                        // My Profile
                        UserCell()
                            .padding(.top)
                        Divider()
                            .padding()
                        
                        // Friends Profile
                        ForEach(0..<20, id: \.self) { i in
                            UserCell()
                            Divider()
                        }
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(leading: Text("친구").font(.system(size: 24, weight: .semibold)),
                                    trailing: Button(
                                        action: {
                                            searchToggle.toggle()
                                        },
                                        label: {
                                            Image(systemName: "magnifyingglass")
                                                .foregroundColor(.black)
                                        }))
                .fullScreenCover(isPresented: $searchToggle , content: {
                    SearchBar(searchBarInput: $searchBarInput, searchBarClicked: $searchBarClicked, searchToggle: $searchToggle)
                })
            }
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
