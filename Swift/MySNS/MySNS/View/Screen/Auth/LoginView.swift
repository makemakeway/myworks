//
//  LoginView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/17.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var passWord: String = ""
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(.systemPurple), Color.red, Color(.systemPink), Color(.systemOrange), Color(.systemIndigo), Color.purple]), startPoint: .topTrailing, endPoint: .bottomLeading).edgesIgnoringSafeArea(.all)
                VStack {
                    Image(systemName: "camera")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120, alignment: .center)
                        .foregroundColor(Color.primary)
                        .padding(.vertical, 40)
                    
                    AuthTextField(input: $email, placeholder: "이메일을 입력하세요.", image: "envelope")
                        .padding(.horizontal, 40)
                    AuthSecureField(input: $passWord, placeholder: "비밀번호를 입력하세요", image: "lock")
                        .padding(.horizontal, 40)
                        .padding(.vertical)
                    HStack {
                        Spacer()
                        Text("비밀번호를 잊으셨나요?")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.primary)
                    }
                    .padding(.trailing, 40)
                    
                    Button(action: { authViewModel.signIn(email: email, password: passWord) }, label: {
                        Text("로그인")
                            .foregroundColor(Color.primary)
                            .frame(height: 40)
                            .frame(maxWidth: .infinity)
                            .background(Color(.systemIndigo))
                            .cornerRadius(20)
                            .padding(.vertical)
                            .padding(.horizontal, 40)
                        
                    })
                    
                    Spacer()
                    NavigationLink(
                        destination: RegistrationView(),
                        label: {
                            Text("계정이 없으신가요?").foregroundColor(Color(.systemGray6)) + Text("  ") + Text("가입하기")
                                .foregroundColor(Color.primary)
                                .fontWeight(.bold)
                        })
                    
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}


