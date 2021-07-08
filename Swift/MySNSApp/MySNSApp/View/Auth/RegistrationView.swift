//
//  RegistrationView.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/07/08.
//

import SwiftUI

struct RegistrationView: View {
    @State var id = ""
    @State var password = ""
    @State var userName = ""
    @State var email = ""
    @State var showImagePicker = false
    @State var selectedImage: Image?
    @State var image: UIImage?
    @Environment(\.presentationMode) var mode : Binding<PresentationMode>
    @ObservedObject var authViewModel = AuthViewModel()
    
    var body: some View {
        ZStack {
            Color(.systemIndigo).edgesIgnoringSafeArea(.all)
            VStack {
                Button(action: { self.showImagePicker.toggle() }, label: {
                    if let selectedImage = selectedImage {
                        selectedImage
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150,  height: 150)
                            .clipShape(Circle())
                            .padding(.top, 80)
                    } else {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150,  height: 150)
                            .padding(.top, 80)
                    }
                })
                .fullScreenCover(isPresented: $showImagePicker, content: {
                    ImagePicker(sourceType: .savedPhotosAlbum) { (image) in
                        self.selectedImage = Image(uiImage: image)
                        self.image = image
                    }
                })
                
                
                
                VStack(spacing: 20) {
                    CustomTextField(text: $userName, placeholder: Text("이름을 입력하세요."), imageName: "person.fill")
                        .clipShape(Capsule())
                        .padding(.horizontal, 40)
                        .accentColor(.white)
                    
                    CustomTextField(text: $email, placeholder: Text("이메일 주소를 입력하세요."), imageName: "envelope.fill")
                        .clipShape(Capsule())
                        .padding(.horizontal, 40)
                        .accentColor(.white)
                    
                    CustomSecureField(text: $password, placeholder: Text("비밀번호를 입력하세요."), imageName: "lock.fill")
                        .clipShape(Capsule())
                        .padding(.horizontal, 40)
                        .accentColor(.white)
                    
                    
                }
                .padding(.top, 60)
                
                Button(action: {
                    guard let image = selectedImage else { return }
                    authViewModel.registerUser(userName: userName, email: email, password: password, profileImage: image)
                    
                }, label: {
                    Text("가입")
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.systemIndigo))
                        .frame(width: 50, height: 16)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                })
                .padding(.top, 20)
                
                Spacer()
                
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    HStack {
                        Text("이미 아이디가 있으신가요?")
                        
                        Text("로그인하기")
                            .fontWeight(.bold)
                    }
                    
                })
                .padding(.bottom, 40)
                
            }
            .foregroundColor(.white)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
