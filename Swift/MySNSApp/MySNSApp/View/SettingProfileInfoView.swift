//
//  SettingProfileInfoView.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/07/05.
//

import SwiftUI

struct SettingProfileInfoView: View {
    @State var userName = ""
    @State var profileMessage = ""
    @State var profileImage = UIImage(systemName: "person")
    @State var modifyMode = false
    @Binding var profileClicked: Bool
    
    var body: some View {
        
        ZStack {
            Color(.systemGray2).edgesIgnoringSafeArea(.all)
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
                    
                    Image(systemName: "person.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .padding()
                        .background(Color(.systemTeal))
                        .cornerRadius(26)
                    
                    Text("이름")
                        .fontWeight(.bold)
                        .font(.title3)
                        .padding(.top, 14)
                        .padding(.bottom, 4)
                    
                    Rectangle()
                        .frame(height: 0)
                    
                    Text("상태메세지")
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
                    .padding(.top, 54)
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
                    
                    
                    Image(systemName: "person.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .padding()
                        .background(Color(.systemTeal))
                        .cornerRadius(26)
                    
                    
                    
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
                    
                    
                    
                    
                    Button(action: { print("modify profileMessage") }, label: {
                        VStack {
                            Text("상태메세지를 입력하세요.")
                                .fontWeight(.bold)
                                .padding(.top, 4)
                                .lineLimit(1)
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
