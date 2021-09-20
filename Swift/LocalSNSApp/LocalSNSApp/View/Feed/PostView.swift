//
//  PostView.swift
//  LocalSNSApp
//
//  Created by 박연배 on 2021/08/18.
//

import SwiftUI

struct PostView: View {
    
    init() {
//        UINavigationBar.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ScrollView {
            ZStack {
                Image(systemName: "house")
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.75)
                    .background(Color.blue)
                    .foregroundColor(.white)
                
            }
            VStack(alignment: .leading) {
                HStack {
                    DefaultProfileImage(length: 50)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("닉네임")
                            .font(.system(size: 16, weight: .heavy))
                        
                        Text("위치")
                            .font(.system(size: 15, weight: .medium))
                    }
                    Spacer()
                }
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(height: 0.3)
                
                Text("아이폰 12pro 퍼시픽블루 128GB 판매합니다")
                    .font(.system(size: 20, weight: .bold))
                
                Text("2분 전")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.gray)
                    .padding(.vertical, 4)
                
                Text("아이폰 12 Pro 128g 퍼시픽블루 색상 판매합니다.\nKt에서 구매하였고 실사용은 4개월하였습니다. 상태는 S급입니다.")
                    .font(.system(size: 16, weight: .medium))
                
                Text("관심 1")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.gray)
                    .padding(.vertical, 8)
                
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(height: 0.3)
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
