//
//  RegistrationView.swift
//  TwitterSwiftUI
//
//  Created by 박연배 on 2021/06/12.
//

import SwiftUI

struct RegistrationView: View {
    @State var email = ""
    @State var password = ""
    @State var username = ""
    @State var fullname = ""
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    // 네비게이션 스택에 새로운 화면이 들어왔을 때, wrap해두는 역할??
    @State var showImagePicker = false
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    @ObservedObject var viewModel = AuthViewModel()
    
    func loadImage() {
        guard let selectedImage = selectedUIImage else { return }
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: { showImagePicker.toggle() }, label: {
                    ZStack {
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .clipShape(Circle())
                                .padding(.top, 88)
                                .padding(.bottom, 16)
                        } else {
                            Image("plus_photo")
                                .resizable()
                                .renderingMode(.template)
                                .scaledToFill()
                                .frame(width: 140, height: 140)
                                .padding(.top, 88)
                                .padding(.bottom, 16)
                                .foregroundColor(.white)
                        }
                        
                    }
                })
                .sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedUIImage)
                })
            
                // SwiftUI에는 이미지픽커기능이 구현되어있지 않아 커스텀해서 사용해야한다.
                
                VStack(spacing: 20) {
                    
                    CustomTextField(text: $fullname, placeholder: Text("Full Name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                    
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 32)
                
                
                Button(action: {
                    guard let image = selectedUIImage else { return }
                    viewModel.registerUser(email: email, password: password, username: username,
                                           fullname: fullname, profileImage: image)
                }, label: {
                    Text("Sign Up")
                        .frame(width: 360, height: 50)
                        .font(.headline)
                        .foregroundColor(.blue)
                        .background(Color(.white))
                        .cornerRadius(25)
                        .padding()
                })
                
                Spacer()
                
                Button(action: { mode.wrappedValue.dismiss() }, label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        
                        
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                            
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                })
                
            }
        }
        .background(Color(#colorLiteral(red: 0.1825715601, green: 0.6299551129, blue: 0.9542170167, alpha: 1)))
        .ignoresSafeArea()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
