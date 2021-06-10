//
//  ContactView.swift
//  GoodAsOldPhone
//
//  Created by 박연배 on 2021/06/09.
//

import SwiftUI

struct ContactView: View {
    var body: some View {
        GeometryReader { geometry in        // header 이미지를 꽉 채우기 위해 geometryreader 사용. 부모의 size와 position에 접근가능
            ScrollView {
                VStack(spacing: 40) {       // vertical Stack으로 세로로 쌓음. 각 원소의 거리를 40px씩 주었음
                    Image("header-contact")
                        .resizable()        // 공간에 맞게 사이즈를 변경할 수 있게 해주는 메소드
                        .scaledToFit()      // 부모에 맞게 배율을 조정
                        .clipped()          // 넘치는 이미지는 잘라냄
                        
                    Text("About Us")
                        .font(.system(size: 28, weight: .bold))
                    
                    Text("새내기 iOS 개발자\n\n\nSwift 클론코딩중입니다.\n\n\nSwiftUI 꿀잼입니다.\n\n\n치킨먹고싶다")
                        .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 20))
                    
                    Text("Contact")
                        .font(.system(size: 28, weight: .bold))
                    
                    VStack(alignment: .leading) {       //요소들을 왼쪽으로 정렬
                        HStack(spacing: 30) {           //이미지와 텍스트를 가로로 두어야하므로, HStack 사용
                            Image("icon-about-email")
                            Link("makemakeway@gmail.com", destination: URL(string: "mailto:makemakeway@gmail.com")!)    // 링크 형식으로, 클릭 시 mail로 이동할 수 있도록 함
                                .foregroundColor(.gray)
                        }
                        HStack(spacing: 30) {
                            Image("icon-about-phone")
                            Link("+82 10-7607-1339", destination: URL(string: "tel:821076071339")!)
                                .foregroundColor(.gray)
                        }
                        HStack(spacing: 30) {
                            Image("icon-about-website")
                            Link("https://github.com/makemakeway", destination: URL(string: "https://github.com/makemakeway")!)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
        }
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView()
    }
}
