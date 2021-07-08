//
//  SettingProfileInfoView.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/07/05.
//

import SwiftUI

struct SettingProfileInfoView: View {
    @State var userName = "이름"
    @State var profileMessage = "프로필 메세지"
    @State var modifyMode = false
    @State var pickedImage: Image?
    @State var showingImagePicker = false
    
    @Binding var profileClicked: Bool
    
    
    var body: some View {
        
        ZStack {
            Color(.systemFill).edgesIgnoringSafeArea(.all)
            VStack(spacing: 12) {
                
                
                // 프로필 편집 모드가 아닐때
                if !modifyMode {
                    // x마크
                    HStack {
                        Button(action: { profileClicked.toggle() }, label: {
                            Image(systemName: "xmark")
                        })
                        Spacer()
                    }
                    .padding(.leading, 24)
                    Spacer()
                    
                    if let pickedImage = pickedImage {
                        pickedImage
                            .resizable()
                            .foregroundColor(.white)
                            .scaledToFill()
                            .frame(width: 70, height: 70)
                            .cornerRadius(23)
                    } else {
                        Image(systemName: "person.fill")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                            .padding()
                            .background(Color(.systemIndigo))
                            .cornerRadius(27)
                    }
                    
                    
                    
                    Text("\(userName)")
                        .fontWeight(.bold)
                        .font(.title3)
                        .padding(.top, 14)
                        .padding(.bottom, 4)
                    
                    Rectangle()
                        .frame(height: 0)
                    
                    Text("\(profileMessage)")
                        .fontWeight(.bold)
                    
                    Rectangle()
                        .frame(height: 0)
                        .padding(.vertical, 0)
                    
                    HStack {
                        Button(action: {
                            withAnimation {
                                modifyMode.toggle()
                            }
                            
                        }, label: {
                            VStack(spacing: 12) {
                                Image(systemName: "pencil")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .scaledToFill()
                                Text("프로필 편집")
                                    .font(.footnote)
                                
                            }
                        })
                    }
                    .padding(.top, 53)
                    .padding(.vertical, 28)
                }
                
                // 프로필 편집 모드일 때
                else {
                    HStack {
                        Button(action: {
                            // 설정값 변경 없이, Modifymode 종료
                            withAnimation{
                                modifyMode.toggle()
                            }
                            
                        }, label: {
                            Text("취소")
                            
                        })
                        Spacer()
                        
                        Button(action: {
                            // 설정값 변경 후, modifymode 종료
                            withAnimation{
                                modifyMode.toggle()
                            }
                            
                        }, label: {
                            Text("완료")
                                .fontWeight(.semibold)
                        })
                    }
                    .padding(.horizontal, 24)
                    Spacer()
                    
                    
                    // profileImage 변경 버튼
                    Button(action: { self.showingImagePicker.toggle() }, label: {
                        
                        if let pickedImage = pickedImage {
                            pickedImage
                                .resizable()
                                .foregroundColor(.white)
                                .scaledToFill()
                                .frame(width: 70, height: 70)
                                .cornerRadius(23)
                        } else {
                            Image(systemName: "person.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 40, height: 40)
                                .padding()
                                .background(Color(.systemIndigo))
                                .cornerRadius(27)
                        }
                            
                    })
                    .fullScreenCover(isPresented: $showingImagePicker, content: {
                        ImagePicker(sourceType: .photoLibrary) { (image) in
                            self.pickedImage = Image(uiImage: image)
                        }
                    })
                    .overlay(Image(systemName: "camera.fill")
                                .resizable()
                                .frame(width: 16, height: 12)
                                .padding(.all, 5)
                                .background(Color.white)
                                .clipShape(Circle())
                                .foregroundColor(.black)
                                .offset(x: 30, y: 30)
                                )
                    
                    
                    
                    
                    
                    // userName 변경 버튼
                    Button(action: { print("modify username") }, label: {
                        VStack {
                            HStack {
                                Text("이름")
                                    .fontWeight(.bold)
                                    .font(.title3)
                                    .padding(.top)
                                    .lineLimit(1)
                            }
                            
                            Rectangle()
                                .frame(height: 1)
                                .padding(.horizontal, 24)
                                .foregroundColor(Color(.systemGray))
                        }
                        .frame(maxWidth: .infinity)
                    })
                    .padding(.vertical, -2)
                    .overlay(Image(systemName: "pencil")
                                .padding(.horizontal, 36)
                             , alignment: .trailing)
                    
                    
                    
                    // profileMessage 변경 버튼
                    Button(action: { print("modify profileMessage") }, label: {
                        VStack {
                            if !profileMessage.isEmpty {
                                Text("\(profileMessage)")
                                    .fontWeight(.bold)
                                    .padding(.top, 4)
                                    .lineLimit(1)
                            } else {
                                Text("상태메세지를 입력하세요.")
                                    .fontWeight(.bold)
                                    .padding(.top, 4)
                                    .lineLimit(1)
                            }
                            
                            Rectangle()
                                .frame(height: 1)
                                .padding(.horizontal, 24)
                                .foregroundColor(Color(.systemGray))
                        }
                        .frame(maxWidth: .infinity)
                    })
                    .overlay(Image(systemName: "pencil")
                                .padding(.horizontal, 36)
                             , alignment: .trailing)
                    
                    
                    
                    
                    HStack {
                        Button(action: { }, label: {
                            VStack(spacing: 12) {
                                Image(systemName: "")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .scaledToFill()
                                
                                Text("")
                            }
                        })
                    }
                    .padding(.top, 50)
                    .padding(.vertical, 30)
                    
                    
                }
                
            }
            .foregroundColor(.white)
            .font(.subheadline)
            
        }
        
        
    }
}

struct SettingProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SettingProfileInfoView(profileClicked: .constant(true))
            .preferredColorScheme(.dark)
    }
}
