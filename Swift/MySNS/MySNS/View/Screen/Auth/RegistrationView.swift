//
//  RegistrationView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/17.
//

import SwiftUI
import UIKit

struct RegistrationView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var userName: String = ""
    @State var userID: String = ""
    init() {
        let tempImage: Image = Image(systemName: "person")
        let defaultImage: UIImage = tempImage.asUIImage()
        self.defaultImage = defaultImage
    }
    let defaultImage: UIImage
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(.systemPurple), Color.red, Color(.systemPink), Color(.systemOrange), Color(.systemIndigo), Color.purple]), startPoint: .topTrailing, endPoint: .bottomLeading).edgesIgnoringSafeArea(.all)
            VStack {
                
                AuthTextField(input: $email, placeholder: "이메일을 입력하세요.", image: "envelope")
                    .padding(.horizontal, 40)
                AuthSecureField(input: $password, placeholder: "비밀번호를 입력하세요.", image: "lock")
                    .padding(.horizontal, 40)
                    .padding(.vertical)
                AuthTextField(input: $userName, placeholder: "이름을 입력하세요.", image: "person")
                    .padding(.horizontal, 40)
                AuthTextField(input: $userID, placeholder: "아이디를 입력하세요.", image: "person")
                    .padding(.horizontal, 40)
                    .padding(.vertical)
                
                Button(action: { authViewModel.registerUser(email: email, password: password, userName: userName, userID: userID, image: defaultImage) }, label: {
                    Text("가입하기")
                        .foregroundColor(Color(.systemGray6))
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemIndigo))
                        .cornerRadius(20)
                        .padding(.vertical)
                        .padding(.horizontal, 40)

                })
                
                Spacer()
                
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    Text("이미 계정이 있으신가요?").foregroundColor(Color(.systemGray6)) + Text("  ") + Text("로그인하기")
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemGray6))
                })
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

//struct RegistrationView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegistrationView(email: "", password: "", userName: "", userID: "")
//    }
//}
