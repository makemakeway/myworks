//
//  Product2DetailView.swift
//  GoodAsOldPhone
//
//  Created by 박연배 on 2021/06/11.
//

import SwiftUI

struct Product2DetailView: View {
    var body: some View {
        ScrollView {
            ZStack {
                Image("phone-fullscreen2")
                    .resizable()
                    .scaledToFill()
    
                VStack {
                    Text("1921 Dial Phone")
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

struct Product2DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Product2DetailView()
    }
}
