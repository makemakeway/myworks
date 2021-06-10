//
//  Product4DetailView.swift
//  GoodAsOldPhone
//
//  Created by 박연배 on 2021/06/11.
//

import SwiftUI

struct Product4DetailView: View {
    var body: some View {
        ScrollView {
            ZStack {
                Image("phone-fullscreen4")
                    .resizable()
                    .scaledToFill()
    
                VStack {
                    Text("1984 Moto Portable")
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

struct Product4DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Product4DetailView()
    }
}
