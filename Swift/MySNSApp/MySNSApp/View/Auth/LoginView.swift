//
//  LoginView.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/07/07.
//

import SwiftUI

struct LoginView: View {
    @State var id = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemIndigo).edgesIgnoringSafeArea(.all)
                VStack {
                    Image(systemName: "message.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120,  height: 120)
                    
                    VStack(spacing: 20) {
                        CustomTextField(text: $id, placeholder: Text("아이디를 입력하세요."), imageName: "person.fill")
                            .clipShape(Capsule())
                            .padding(.horizontal, 40)
                            .accentColor(.white)
                        
                        CustomSecureField(text: $password, placeholder: Text("비밀번호를 입력하세요."), imageName: "lock.fill")
                            .clipShape(Capsule())
                            .padding(.horizontal, 40)
                            .accentColor(.white)
                        
                        Button(action: {}, label: {
                            Text("로그인")
                                .fontWeight(.semibold)
                                .foregroundColor(Color(.systemIndigo))
                                .frame(width: 50, height: 16)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                        })
                    }
                    .padding(.top, 60)
                    
                    Spacer()
                    
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
