//
//  HomeView.swift
//  TetrisGameApp
//
//  Created by 박연배 on 2021/08/31.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.black
            VStack(spacing: 32) {
                Spacer()
                Text("T E T R I S")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.gray)
                
                
                Button(action: {  }, label: {
                    Text("START GAME")
                        .font(.system(size: 18, weight: .semibold))
                })
                
                Spacer()
            }
            
        }
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
