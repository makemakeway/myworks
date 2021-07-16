//
//  ContentView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                FeedView(posts: PostArrayObject())
            }
            .tabItem { Image(systemName: "house.fill") }
            
            
            Text("SearchView")
                .tabItem { Image(systemName: "magnifyingglass") }
            
            
            Text("ShortViedoView")
                .tabItem { Image(systemName: "play.rectangle") }
            
            
            Text("ProfileView")
                .tabItem { Image(systemName: "person.circle.fill") }
            
        }
        .accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
