//
//  ContentView.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/06/25.
//

import SwiftUI

struct ContentView: View {
    init() {
        UINavigationBar.appearance().isHidden = true
    }
    
    
    
    var body: some View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
