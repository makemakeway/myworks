//
//  ProfileView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/17.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var profileViewModel: ProfileViewModel
    var throughSearch: Bool
    @State var navButtonClicked = false
    let user: UserModel
    private let width = UIScreen.main.bounds.width / 3
    
    init(user: UserModel, throughSearch: Bool) {
        self.user = user
        self.profileViewModel = ProfileViewModel(user: user)
        self.throughSearch = throughSearch
    }
    
    var body: some View {
        ScrollView {
            VStack {
                // MARK: 프로필 사진, 게시물, 팔로워, 팔로잉 숫자
                ProfileHeaderView(profileViewModel: profileViewModel)
                
                // MARK: 아이디(userID)는 네비게이션 영역으로 빼두었음.)
                
                
                
                // MARK: 유저이름 영역(userName)
                HStack {
                    Text("\(user.userName)")
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                // MARK: 프로필 정보 변경 버튼
                ProfileButtonView(profileViewModel: profileViewModel)
                
                // MARK: 내 포스트들의 영역
                
                
                SearchGridView(config: .profile(user.id ?? ""))
                    .padding(.top)
                
                
                
                
            }
            // 검색창을 통해 방문했을 때
            if throughSearch {
                EmptyView()
                    .navigationBarBackButtonHidden(true)
                    .navigationBarTitle("\(user.userID)", displayMode: .inline)
                    .navigationBarItems(leading: Button(action: {
                        mode.wrappedValue.dismiss()
                    },
                    label: {
                        Image(systemName: "chevron.left")
                    }))
            }
            else {
                EmptyView()
                    .navigationBarItems(leading: Text("\(user.userID)")
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
                                                                            buttons: [
                                                                                .cancel(Text("취소")),
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
