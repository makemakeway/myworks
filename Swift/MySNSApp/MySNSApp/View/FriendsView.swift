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
    @State var menuToggle = false
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var userViewModel = UserViewModel()
    
    
    var body: some View {
        
        
        
        NavigationView {
            
            VStack {
                List {
                    // 내 프로필
                    Button(action: {
                        profileClicked.toggle()
                        print("toggled")
                    }, label: {
//                        UserCell(user: userViewModel.users[0])
                    })
                    .padding(.top, 10)
                    .fullScreenCover(isPresented: $profileClicked, content: {
                        SettingProfileInfoView(profileClicked: $profileClicked)
                    })
                    HStack {
                        Text("친구")
                            .fontWeight(.semibold)
                        Text("\(userViewModel.users.count)")
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    // 친구 프로필
                    ForEach(userViewModel.users) { user in
                        
                        UserCell(user: user)
                    }
                    
                }
                .padding(.horizontal, -20)
                .listStyle(PlainListStyle())
                .fullScreenCover(isPresented: $searchToggle , content: {
                    SearchBar(searchBarInput: $searchBarInput, searchBarClicked: $searchBarClicked, searchToggle: $searchToggle)
                })
                .navigationBarItems(leading: Text("친구").font(.title2).fontWeight(.semibold),
                                    trailing:
                                        HStack(spacing: 20) {
                                            // 검색 버튼
                                            Button(
                                                action: { self.searchToggle.toggle() },
                                                label: { Image(systemName: "magnifyingglass").foregroundColor(.gray) })
                                            
                                            // 로그아웃 버튼
                                            Button(
                                                action: { self.menuToggle.toggle() },
                                                label: {
                                                    Image(systemName: "ellipsis").foregroundColor(.gray)
                                                })
                                                .actionSheet(isPresented: $menuToggle, content: {
                                                    ActionSheet(title: Text(""),
                                                                message: Text(""),
                                                                buttons: [
                                                                    .cancel(Text("취소")),
                                                                    .destructive(
                                                                        Text("로그아웃"),
                                                                        action: {
                                                                            authViewModel.signOut()
                                                                        })
                                                                    
                                                                ])
                                                })
                                        })
                .navigationBarTitle("", displayMode: .inline)
            }
            
            
        }
        
        
    }
}


struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
        //            .preferredColorScheme(.dark)
    }
}
