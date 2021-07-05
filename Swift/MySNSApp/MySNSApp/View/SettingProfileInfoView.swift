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
    @State var modifyMode = true
    @Binding var profileClicked: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGray2).edgesIgnoringSafeArea(.all)
                VStack(spacing: 12) {
                    
                    
                    // 프로필 편집 모드가 아닐때
                    if modifyMode == false {
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
                            .padding(.top)
                        
                        Text("상태메세지를 입력하세요.")
                            .fontWeight(.bold)
                        
                        HStack {
                            Button(action: {
                                modifyMode = true
                                
                            }, label: {
                                VStack(spacing: 12) {
                                    Image(systemName: "pencil")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .scaledToFill()
                                    Text("프로필 편집")
                                        .fontWeight(.bold)
                                    
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
                                modifyMode = false
                                
                            }, label: {
                                Text("취소")
                                    .fontWeight(.semibold)
                            })
                            Spacer()
                            
                            Button(action: {
                                // 설정값 변경 후, modifymode 종료
                                modifyMode = false
                                
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
                        
                        
                        
                        Text("이름")
                            .fontWeight(.bold)
                            .font(.title3)
                            .padding(.top)
                        
                        
                        
                        Text("상태메세지를 입력하세요.")
                            .fontWeight(.bold)
                        
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
                        .padding(.top, 54)
                        .padding(.vertical, 30)
                        
                        
                    }
                    
                }
                .foregroundColor(.white)
                .font(.subheadline)
                
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            
        }
        
    }
}

struct SettingProfileInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SettingProfileInfoView( profileClicked: .constant(true))
            .preferredColorScheme(.dark)
    }
}
