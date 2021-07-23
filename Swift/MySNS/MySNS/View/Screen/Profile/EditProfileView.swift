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
    @State private var userName: String
    @State private var userId: String
    @State private var bio: String = ""
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @State private var isPresented = false
    
    init(viewModel: EditProfileViewModel) {
        self.editProfileViewModel = viewModel
        _userId = .init(initialValue: viewModel.user.userID)
        _userName = .init(initialValue: viewModel.user.userName)
        _bio = .init(initialValue: viewModel.user.bio ?? "")
    }
    
    var body: some View {
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
                    if let image = selectedImage {
                        editProfileViewModel.UploadProfileImage(image: image) { _ in
                        }
                    }
                    editProfileViewModel.saveUserData(bio: bio, userId: userId, userName: userName)
                },
                label: {Text("완료").fontWeight(.bold)})
            }
            .padding(.horizontal)
            
            Rectangle()
                .foregroundColor(.gray)
                .frame(height: 0.5)
            
            // MARK: Profile Image
            VStack {
                VStack {
                    if editProfileViewModel.user.profileImageUrl.isEmpty {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .background(Color(.systemGray4))
                            .foregroundColor(.primary)
                            .cornerRadius(50)
                            .padding()
                    } else if selectedImage == nil {
                        KFImage(URL(string: editProfileViewModel.user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .cornerRadius(50)
                            .padding()
                    } else {
                        if let image = profileImage {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .cornerRadius(50)
                                .padding()
                        }
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
        .onReceive(editProfileViewModel.$uploadComplete, perform: { complete in
            if complete {
                self.mode.wrappedValue.dismiss()
            }
        })
    }
}

extension EditProfileView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}
