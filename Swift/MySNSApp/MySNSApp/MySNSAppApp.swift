//
//  MySNSAppApp.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/06/25.
//

import SwiftUI
import Firebase

@main
struct MySNSAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel())
        }
    }
}
