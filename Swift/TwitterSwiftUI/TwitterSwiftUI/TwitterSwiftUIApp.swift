//
//  TwitterSwiftUIApp.swift
//  TwitterSwiftUI
//
//  Created by 박연배 on 2021/06/09.
//

import SwiftUI
import Firebase

@main
struct TwitterSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
//            ContentView()
            LoginView()
        }
    }
}
