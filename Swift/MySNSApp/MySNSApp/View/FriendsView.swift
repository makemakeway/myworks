//
//  FriendsView.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/06/25.
//

import SwiftUI

struct FriendsView: View {
    @State var profileClicked = false
    @State var searchBarInput = ""
    @State var searchBarClicked = false
    @State var searchToggle = false
    @State var profiles = [
        Profile(userName: "Yeonpark", profileMessage: "iOS", profileImage: UIImage(systemName: "person")),
        Profile(userName: "Nosick", profileMessage: "StarBucks", profileImage: UIImage(systemName: "person")),
        Profile(userName: "JJangSuck", profileMessage: "China", profileImage: UIImage(systemName: "person"))
    ]
    
    
    
    var body: some View {
        
        
        
        NavigationView {
            ScrollView {
                VStack {
                    VStack {
                        // My Profile
                        Button(action: {
                            profileClicked.toggle()
                            print("toggled")
                        }, label: {
                            UserCell()
                        })
                        .padding(.top, 10)
                        .padding(.horizontal, 0)
                        .fullScreenCover(isPresented: $profileClicked, content: {
                            SettingProfileInfoView(profileClicked: $profileClicked)
                        })
                        
                        
                        HStack {
                            Text("친구")
                                .fontWeight(.semibold)
                            Text("0")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        
                        Spacer()
                        
                        // Friends Profile
                        ForEach(0..<20) { profile in
                            
                            UserCell()
                        }
                        .padding(.horizontal, 0)
                        .listStyle(PlainListStyle())
                    }
                    
                    .fullScreenCover(isPresented: $searchToggle , content: {
                        SearchBar(searchBarInput: $searchBarInput, searchBarClicked: $searchBarClicked, searchToggle: $searchToggle)
                    })
                    
                }
            }
            .navigationBarItems(leading: Text("친구").font(.title2).fontWeight(.semibold),
                                trailing: Button(
                                    action: { self.searchToggle.toggle() },
                                    label: { Image(systemName: "magnifyingglass").foregroundColor(.gray) }))
            .navigationBarTitle("", displayMode: .inline)
        }
        
        
    }
}


struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
        //            .preferredColorScheme(.dark)
    }
}
