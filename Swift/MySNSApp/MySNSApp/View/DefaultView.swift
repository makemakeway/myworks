//
//  DefaultView.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/07/09.
//

import SwiftUI

struct DefaultView: View {
    @ObservedObject var authViewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            Color.yellow.edgesIgnoringSafeArea(.all)
            TabView {
                FriendsView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("친구")
                    }
                Text("메세지")
                    .tabItem {
                        Image(systemName: "envelope.fill")
                        Text("메세지")
                    }
            }
            
        }
    }
}

//struct DefaultView_Previews: PreviewProvider {
//    static var previews: some View {
//        DefaultView()
//    }
//}
