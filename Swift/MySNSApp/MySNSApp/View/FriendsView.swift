//
//  FriendsView.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/06/25.
//

import SwiftUI

struct FriendsView: View {
    @State var myProfileClicked = false
    @State var profileClicked = false
    @State var searchBarInput = ""
    @State var searchBarClicked = false
    @State var searchToggle = false
    @State var menuToggle = false
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var userViewModel = UserViewModel()
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    
    
    var body: some View {
        
        
        
        NavigationView {
            
            VStack {
                List {
                    ForEach(userViewModel.users) { user in
                        if authViewModel.userSession?.uid == user.id {
                            Button(action: { myProfileClicked.toggle() }, label: {
                                UserCell(user: user)
                            })
                            .fullScreenCover(isPresented: $myProfileClicked, content: {
                                SettingProfileInfoView(myProfileClicked: $myProfileClicked, user: user)
                            })
                        }
                    }
                    
                    
                    HStack {
                        Text("친구")
                            .fontWeight(.semibold)
                        if userViewModel.users.count == 1 {
                            Text("0")
                                .fontWeight(.semibold)
                        } else {
                            Text("\(userViewModel.users.count - 1)")
                                .fontWeight(.semibold)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    // 친구 프로필
                    ForEach(userViewModel.users) { user in
                        if authViewModel.userSession?.uid != user.id {
                            Button(action: { profileClicked.toggle() }, label: {
                                UserCell(user: user)
                            })
                            .fullScreenCover(isPresented: $profileClicked, content: {
                                ShowProfileView(profileClicked: $profileClicked, user: user)
                            })
                        }
                        
                    }
                    
                    
                    
                }
                .padding(.horizontal, -20)
                .listStyle(PlainListStyle())
                .fullScreenCover(isPresented: $searchToggle , content: {
                    SearchBar(searchBarInput: $searchBarInput, searchBarClicked: $searchBarClicked, searchToggle: $searchToggle, userViewModel: userViewModel)
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
