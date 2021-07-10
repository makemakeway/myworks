//
//  ContentView.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/06/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        Group {
            if authViewModel.userSession != nil {
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
            else {
                LoginView()
            }
        }
        
        
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.dark)
//    }
//}
