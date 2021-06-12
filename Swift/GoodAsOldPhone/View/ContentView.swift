//
//  ContentView.swift
//  GoodAsOldPhone
//
//  Created by 박연배 on 2021/06/09.
//
//  https://github.com/soapyigu/Swift-30-Projects 을 참고하여 만든 앱
//  원본 프로젝트는 UIkit을 이용하여 만들었으나, SwiftUI가 재미있어 SwiftUI로 제작하였음
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
                TabView {           // tab을 통해 view를 보여주기 위해, navigationview안에서 tabview로 view를 감싸주었음
                    ProductView()
                        .tabItem {
                            Image(systemName: "pencil")
                            Text("Product")
                        }
                    ContactView()
                        .tabItem {
                            Image(systemName: "phone")
                            Text("Contact")
                        }
                }
                .navigationBarTitle("", displayMode: .inline)
            // navigationBarTitle을 처리해두지 않으면 상단 네비게이션바가 영역을 많이 차지하여
            // navigationBarTitle을 ""로 설정 뒤, inline모드를 통해 안쪽으로 집어넣었음.
            // navigation에 관련된 속성은 navigationview의 브라켓 안쪽에서 설정해야함.
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
