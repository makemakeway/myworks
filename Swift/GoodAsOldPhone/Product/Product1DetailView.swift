//
//  Product1DetailView.swift
//  GoodAsOldPhone
//
//  Created by 박연배 on 2021/06/10.
//

import SwiftUI

struct Product1DetailView: View {
    var body: some View {
        ScrollView {
            ZStack {
                Image("phone-fullscreen1")
                    .resizable()
                    .scaledToFill()
    
                VStack {
                    Text("1907 Wall Set")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
                           label: {
                        Image("button-addtocart")
                            .padding(.top, 40.0)
                    })
                    Spacer()
                    
                }
            }
        }
    }
}

struct Product1DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Product1DetailView()
    }
}
