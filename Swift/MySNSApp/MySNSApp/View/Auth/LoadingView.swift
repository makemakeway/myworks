//
//  LoadingView.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/07/07.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemIndigo).edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "message.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120,  height: 120)
            }
            .foregroundColor(.white)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
