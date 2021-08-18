//
//  ContentView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/16.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var feedViewModel = FeedViewModel()
    
    var body: some View {
        if authViewModel.userSession != nil {
            if let user = authViewModel.currentUser {
                TabView {
                    NavigationView {
                        FeedView(feedViewModel: feedViewModel)
                            
                    }
                    .navigationViewStyle(StackNavigationViewStyle())
                    .tabItem { Image(systemName: "house.fill") }
                    
                    
                    NavigationView {
                       SearchView()
                    }
                    .tabItem { Image(systemName: "magnifyingglass") }
                    .navigationViewStyle(StackNavigationViewStyle())
                    
                    
                    NavigationView {
                        LazyView(ProfileView(user: user, throughSearch: false))
                            
                    }
                    .tabItem { Image(systemName: "person.circle") }
                    .navigationViewStyle(StackNavigationViewStyle())
                    
                }
                .accentColor(.primary)
            }
        }
        else {
            LoginView()
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
