//
//  Product3DetailView.swift
//  GoodAsOldPhone
//
//  Created by 박연배 on 2021/06/11.
//

import SwiftUI

struct Product3DetailView: View {
    var body: some View {
        ScrollView {
            ZStack {
                Image("phone-fullscreen3")
                    .resizable()
                    .scaledToFill()
    
                VStack {
                    Text("1937 Desk Set")
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

struct Product3DetailView_Previews: PreviewProvider {
    static var previews: some View {
        Product3DetailView()
    }
}
