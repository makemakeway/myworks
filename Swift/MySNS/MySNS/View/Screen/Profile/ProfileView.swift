//
//  ProfileView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/17.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var profileViewModel: ProfileViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var throughSearch: Bool
    @State private var navButtonClicked = false
    private let width = UIScreen.main.bounds.width / 3
    
    init(user: UserModel, throughSearch: Bool) {
        self.profileViewModel = ProfileViewModel(user: user)
        self.throughSearch = throughSearch
    }
    
    var body: some View {
        ScrollView {
            VStack {
                // MARK: 프로필 사진, 게시물, 팔로워, 팔로잉 숫자
                ProfileHeaderView(user: profileViewModel.user)
                
                // MARK: 아이디(userID)는 네비게이션 영역으로 빼두었음.)

                // MARK: 유저이름 영역(userName)
                HStack {
                    Text("\(profileViewModel.user.userName)")
                        .font(.system(size: 16, weight: .semibold))
                    Spacer()
                }
                .padding(.horizontal)
                
                if let bio = profileViewModel.user.bio {
                    HStack {
                        Text(bio)
                            .font(.system(size: 15))
                        Spacer()
                    }
                    .padding(.top)
                    .padding(.horizontal)
                }
                
                // MARK: 프로필 정보 변경 버튼
                ProfileButtonView(profileViewModel: profileViewModel)
                    .padding(.top)
                
                // MARK: 내 포스트들의 영역
                
                
                SearchGridView(config: .profile(profileViewModel.user.id ?? ""))
                    .padding(.top)
                
            }
            
            if throughSearch {
                EmptyView()
                    .navigationBarTitle("\(profileViewModel.user.userID)", displayMode: .inline)
            }
            else {
                EmptyView()
                    .navigationBarItems(leading: Text("\(profileViewModel.user.userID)")
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.primary),
                                        trailing: Button(action: { navButtonClicked.toggle() }, label: {
                                            Image(systemName: "text.justify")
                                                .foregroundColor(.primary)
                                                .actionSheet(isPresented: $navButtonClicked,
                                                             content: {
                                                                ActionSheet(title: Text(""),
                                                                            message: Text(""),
                                                                            buttons: [.cancel(Text("취소")),
                                                                                      .destructive(Text("로그아웃"), action: {
                                                                                        authViewModel.signOut()
                                                                                      })
                                                                            ])
                                                             })
                                        }))
                    .navigationBarTitle("", displayMode: .inline)
            }
            
            
        }
    }
}


//struct ProfileView_Previews: PreviewProvider {
//    @EnvironmentObject var authViewModel: AuthViewModel
//    static var previews: some View {
//        NavigationView {
//            ProfileView()
//        }
//    }
//}
