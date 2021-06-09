//
//  ContentView.swift
//  GoodAsOldPhone
//
//  Created by 박연배 on 2021/06/09.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                Text("ProductView")
                    .tabItem {
                        Image(systemName: "pencil")
                        Text("Product")
                    }
                ContactView()
                    .tabItem {
                        Image(systemName: "phone")
                        Text("Contact")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
