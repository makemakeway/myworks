//
//  ProductView.swift
//  GoodAsOldPhone
//
//  Created by 박연배 on 2021/06/09.
//

import SwiftUI

struct ProductView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 2) { // productCell을 스크롤 뷰 형식으로 세로로 쌓음
                ForEach(1..<2) { n in
                    NavigationLink(
                        destination: Product1DetailView(),
                        label: {
                            ProductCell1()
                                .foregroundColor(.black)
                        })
                        .background(Color(.white))
                    // 이런식으로 forEach문을 사용하여 상품페이지를 만들고 싶었으나, 어떻게 적용할지 방법이 생각나지 않아 하드코딩하였음 ㅠ.ㅠ
                    // Swift를 더 배운 뒤, 방법을 알게 되면 변경할 예정
                }
                
                NavigationLink(
                    destination: Product2DetailView(),
                    label: {
                        ProductCell2()
                            .foregroundColor(.black)
                    })
                    .background(Color(.white))
                
                NavigationLink(
                    destination: Product3DetailView(),
                    label: {
                        ProductCell3()
                            .foregroundColor(.black)
                    })
                    .background(Color(.white))
                
                NavigationLink(
                    destination: Product4DetailView(),
                    label: {
                        ProductCell4()
                            .foregroundColor(.black)
                    })
                    .background(Color(.white))
            }
            .padding(.top, 30)
        }
        .background(Color(.systemGray5))
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
