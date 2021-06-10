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
            VStack(alignment: .center, spacing: 4) {
                ForEach(1..<5) { n in
                    NavigationLink(
                        destination: Product1DetailView(),
                        label: {
                            ProductCell1()
                                .foregroundColor(.black)
                        })
                        .background(Color(.white))
                }
            }
            .padding(.top)
        }
        .padding(.top, 30.0)
        .background(Color(.systemGray5))
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
