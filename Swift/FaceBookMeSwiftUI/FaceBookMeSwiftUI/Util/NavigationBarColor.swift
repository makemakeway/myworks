//
//  NavigationBarColor.swift
//  FaceBookMeSwiftUI
//
//  Created by 박연배 on 2021/06/15.
//

import SwiftUI

struct NavigationBarColor: ViewModifier {
    
    var backgroundColor: UIColor
    
    init(backgroundColor: UIColor) {
        self.backgroundColor = backgroundColor
        let colorAppearance = UINavigationBarAppearance()                       // navigation bar 모양을 지정하기 위한 객체
        colorAppearance.configureWithTransparentBackground()                    // 그림자 없이 투명한 배경으로 navigationbar 객체 구성
        colorAppearance.backgroundColor = .clear
        colorAppearance.titleTextAttributes = [.foregroundColor: UIColor.black] // navigationtitle 속성 설정.(제목이 일반크기일때)
        colorAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black] // 제목이 largetitle일때 속성설정
        
        
        // NavigationBar의 프레젠테이션 스타일
        UINavigationBar.appearance().standardAppearance = colorAppearance
        UINavigationBar.appearance().compactAppearance = colorAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = colorAppearance
        UINavigationBar.appearance().tintColor = .white
        
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}


extension View {
    func navigationColor(_ backgroundColor: UIColor) -> some View {
        self.modifier(NavigationBarColor(backgroundColor: backgroundColor))
    }
}
