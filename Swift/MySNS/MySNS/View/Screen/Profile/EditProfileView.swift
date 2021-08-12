//
//  EditProfileView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/22.
//

import SwiftUI
import Kingfisher


struct EditProfileView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @ObservedObject var editProfileViewModel: EditProfileViewModel
    @Binding var user: UserModel
    @State private var userName: String
    @State private var userId: String
    @State private var bio: String
    @State private var selectedImage: UIImage? = nil
    @State private var profileImage: Image? = nil
    @State private var isPresented = false
    @State private var uploading = false
    
    init(user: Binding<UserModel>) {
        self._user = user
        self.editProfileViewModel = EditProfileViewModel(user: self._user.wrappedValue)
        _userId = State(initialValue: user.wrappedValue.userID)
        _userName = State(initialValue: user.wrappedValue.userName)
        _bio = State(initialValue: user.wrappedValue.bio ?? "")
    }
    
    var body: some View {
        ZStack {
            if uploading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                    .scaleEffect(3.0)
                    
            }
            
            ScrollView {
                // MARK: Navigation
                HStack {
                    Button(action: { mode.wrappedValue.dismiss() },
                           label: {Text("취소").foregroundColor(.primary)})
                    
                    Spacer()
                    
                    Text("프로필 편집")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Button(action: {
                        DispatchQueue.global().sync {
                            editProfileViewModel.saveUserData(bio: bio, userId: userId, userName: userName, image: selectedImage)
                            self.uploading = true
                        }
                    },
                    label: {Text("완료").fontWeight(.bold)})
                }
                .padding(.horizontal)
                
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(height: 0.5)
                
                // MARK: Profile Image
                VStack {
                    LazyVStack {
                            // 이미지 피커로 이미지를 골랐을 경우
                        if let image = profileImage {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .cornerRadius(50)
                                .padding()
                            
                            // 유저 프로필 이미지가 없고, 이미지피커로 이미지를 고르기 전일 경우
                        } else if user.profileImageUrl.isEmpty {
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .background(Color(.systemGray4))
                                .foregroundColor(.primary)
                                .cornerRadius(50)
                                .padding()
                        } else {
                            KFImage(URL(string: user.profileImageUrl))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .cornerRadius(50)
                                .padding()
                        }
                        
                        Button(action: { isPresented.toggle() }, label: {
                            Text("프로필 사진 바꾸기")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.blue)
                        })
                        .padding(.bottom)
                        .fullScreenCover(isPresented: $isPresented, onDismiss: loadImage) {
                            ImagePicker(image: $selectedImage)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(height: 0.3)
                    
                    // MARK: Biograpy
                    HStack(alignment: .center) {
                        VStack(alignment: .leading) {
                            Text("이름").font(.system(size: 15))
                            Spacer()
                            Text("사용자 이름").font(.system(size: 15))
                            Spacer()
                            Text("소개").font(.system(size: 15))
                        }
                        .padding(.leading)
                        
                        VStack {
                            TextField("이름", text: $userName)
                            
                            Rectangle()
                                .foregroundColor(.gray)
                                .frame(height: 0.3)
                            
                            TextField("사용자 이름", text: $userId)
                            
                            Rectangle()
                                .foregroundColor(.gray)
                                .frame(height: 0.3)
                            
                            TextField("소개", text: $bio)
                        }
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        
                    }
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(height: 0.3)
                    
                }
                .navigationBarHidden(true)
            }
            // 업로드가 끝났을 경우 실행
            .onReceive(editProfileViewModel.$uploadComplete, perform: { complete in
                if complete {
                    self.user.profileImageUrl = editProfileViewModel.user.profileImageUrl
                    self.user.userName = editProfileViewModel.user.userName
                    self.user.userID = editProfileViewModel.user.userID
                    self.user.bio = editProfileViewModel.user.bio
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.mode.wrappedValue.dismiss()
                    }
                }
        })
        }
    }
}

extension EditProfileView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
        print("DEBUG: loadImage excuted..")
    }
}
