//
//  ShowProfileView.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/07/10.
//

import SwiftUI
import Kingfisher

struct ShowProfileView: View {
    @State var userName = "이름"
    @State var profileMessage = "프로필 메세지"
    @State var modifyMode = false
    @State var pickedImage: Image?
    @State var showingImagePicker = false
    @Binding var profileClicked: Bool
    let user: User
    
    var body: some View {
        ZStack {
            Color(.systemGray2).edgesIgnoringSafeArea(.all)
            VStack(spacing: 12) {
                // x마크
                HStack {
                    Button(action: { profileClicked.toggle() }, label: {
                        Image(systemName: "xmark")
                    })
                    Spacer()
                }
                .padding(.leading, 24)
                Spacer()
                
                
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .foregroundColor(.white)
                    .scaledToFill()
                    .frame(width: 70, height: 70)
                    .cornerRadius(23)
                
                Text("\(user.username)")
                    .fontWeight(.bold)
                    .font(.title3)
                    .padding(.top, 14)
                    .padding(.bottom, 4)
                
                Rectangle()
                    .frame(height: 0)
                
                Text("\(user.profileMessage)")
                    .fontWeight(.bold)
                
                Rectangle()
                    .frame(height: 0)
                    .padding(.vertical, 0)
                
                HStack {
                    // 메세지 창으로 이동
                    Button(action: {
                        
                    }, label: {
                        VStack(spacing: 12) {
                            Image(systemName: "bubble.left.and.bubble.right.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .scaledToFill()
                            Text("1:1 채팅")
                                .font(.footnote)
                            
                        }
                    })
                }
                .padding(.top, 53)
                .padding(.vertical, 28)
            }
        }
        .foregroundColor(.white)
        .font(.subheadline)
    }
}


//struct ShowProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShowProfileView()
//    }
//}
