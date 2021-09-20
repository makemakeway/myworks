//
//  ContentView.swift
//  LocalSNSApp
//
//  Created by 박연배 on 2021/08/16.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var location: CurrentLocation
    
    
    var body: some View {
        TabView {
            NavigationView {
                FeedView()
                    .tabItem { Image(systemName: "house") }
            }.navigationViewStyle(StackNavigationViewStyle())
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
