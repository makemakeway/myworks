//
//  ResetPasswordView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI

struct ResetPasswordView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @Environment(\.presentationMode) var mode
    @Binding var email: String
    
    init(email: Binding<String>) {
        self._email = email
    }
    
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.systemPurple), Color.red, Color(.systemPink), Color(.systemOrange), Color(.systemIndigo), Color.purple]), startPoint: .topTrailing, endPoint: .bottomLeading).edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "camera")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120, alignment: .center)
                    .foregroundColor(Color.white)
                    .padding(.vertical, 40)
                
                AuthTextField(input: $email, placeholder: "이메일을 입력하세요.", image: "envelope")
                    .padding(.horizontal, 40)
                
                HStack {
                    Spacer()
                    Button(action: { mode.wrappedValue.dismiss() }, label: {
                        Text("로그인하기")
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                    })
                }
                .padding(.top)
                .padding(.trailing, 40)
                
                
                Button(action: {
                    authViewModel.resetPassword(withEmail: email)
                }, label: {
                    Text("비밀번호 찾기")
                        .foregroundColor(Color.white)
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemIndigo))
                        .cornerRadius(20)
                        .padding(.vertical)
                        .padding(.horizontal, 40)
                    
                })
                
                Spacer()
                
                
                
            }
        }
        .onReceive(authViewModel.$didReset, perform: { _ in
            mode.wrappedValue.dismiss()
        })
    }
}
