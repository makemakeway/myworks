//
//  LoginView.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/07/07.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @ObservedObject var authViewModel = AuthViewModel()
    @State var error = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemIndigo).edgesIgnoringSafeArea(.all)
                VStack {
                    // 로고 이미지
                    Image(systemName: "message.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120,  height: 120)
                    
                    // 텍스트필드 영역
                    VStack(spacing: 20) {
                        CustomTextField(text: $email, placeholder: Text("이메일을 입력하세요."), imageName: "person.fill")
                            .clipShape(Capsule())
                            .padding(.horizontal, 40)
                            .accentColor(.white)
                        
                        CustomSecureField(text: $password, placeholder: Text("비밀번호를 입력하세요."), imageName: "lock.fill")
                            .clipShape(Capsule())
                            .padding(.horizontal, 40)
                            .accentColor(.white)
                        
                        // 로그인 버튼
                        Button(action: {
                            authViewModel.signIn(email: email, password: password)
                            if authViewModel.error != "" {
                                self.error = true
                            }
                            
                        }, label: {
                            Text("로그인")
                                .fontWeight(.semibold)
                                .foregroundColor(Color(.systemIndigo))
                                .frame(width: 50, height: 16)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                        })
                        .alert(isPresented: $error, content: {
                            Alert(title: Text("에러"), message: Text(String("\(authViewModel.error)")), dismissButton: .default(Text("확인")))
                        })
                    }
                    .padding(.top, 60)
                    
                    Spacer()
                    
                    // 가입하기 버튼
                    NavigationLink(
                        destination: RegistrationView().navigationBarBackButtonHidden(true),
                        label: {
                            HStack {
                                Text("아이디가 없으신가요?")
                                
                                
                                Text("가입하기")
                                    .fontWeight(.bold)
                                
                            }
                        })
                        .padding(.bottom, 40)
                }
                .foregroundColor(.white)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
    }
}
