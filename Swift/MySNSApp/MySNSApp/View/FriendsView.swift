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
        ZStack {
            NavigationView {
                VStack {
                    List {
                        // My Profile
                        Button(action: {
                            profileClicked.toggle()
                            print("toggled")
                        }, label: {
                            UserCell()
                            
                        })
                        .padding(.horizontal, -20)
                        .fullScreenCover(isPresented: $profileClicked, content: {
                            SettingProfileInfoView(profileClicked: $profileClicked)
                        })
                        
                        
                        HStack {
                            Text("친구")
                            
                            Text("0")
                        }
                        
                        
                        
                        // Friends Profile
                        ForEach(profiles) { profile in
                            
                            UserCell()
                        }
                        .padding(.horizontal, -20)
                        
                    }
                    .listStyle(PlainListStyle())
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarItems(leading: Text("친구").font(.system(size: 24, weight: .semibold)),
                                        trailing: Button(
                                            action: {
                                                searchToggle.toggle()
                                                print("toggled")
                                            },
                                            label: {
                                                Image(systemName: "magnifyingglass")
                                                    .foregroundColor(.white)
                                            }))
                    .fullScreenCover(isPresented: $searchToggle , content: {
                        SearchBar(searchBarInput: $searchBarInput, searchBarClicked: $searchBarClicked, searchToggle: $searchToggle)
                    })
                    
                }
            }
            
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
            .preferredColorScheme(.dark)
    }
}
