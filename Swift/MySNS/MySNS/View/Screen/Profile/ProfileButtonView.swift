//
//  ProfileButtonView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI

struct ProfileButtonView: View {
    @ObservedObject var profileViewModel: ProfileViewModel
    @State var editMode: Bool = false
    
    var isFollowed: Bool { return profileViewModel.user.isFollowed ?? false }
    
    var body: some View {
        if profileViewModel.user.isCurrentUser {
            HStack {
                Button(action: { editMode.toggle() }, label: {
                    Text("프로필 편집")
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.7))
                        .padding(.horizontal)
                })
                .fullScreenCover(isPresented: $editMode, content: {
                    EditProfileView(user: $profileViewModel.user)
                })
            }
            
            
            
        } else {
            HStack {
                if isFollowed {
                    Button(action: { profileViewModel.unfollow() }, label: {
                        HStack {
                            Text("팔로잉")
                            Image(systemName: "checkmark")
                        }
                        .foregroundColor(.primary)
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.8))
                    
                } else {
                    Button(action: { profileViewModel.follow() }, label: {
                        Text("팔로우")
                            .foregroundColor(.white)
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(Color(#colorLiteral(red: 0.1141172731, green: 0.541489393, blue: 1, alpha: 1)))
                    .cornerRadius(10)
                }
                
                
                Spacer()
                
                Button(action: { }, label: {
                    Text("메시지")
                        .foregroundColor(.primary)
                })
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 0.8))
                
                
            }
            .font(.system(size: 15, weight: .semibold))
            .padding(.horizontal)
            
        }
        
    }
}


