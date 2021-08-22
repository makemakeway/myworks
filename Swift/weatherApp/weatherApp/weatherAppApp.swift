//
//  weatherAppApp.swift
//  weatherApp
//
//  Created by 박연배 on 2021/08/22.
//

import SwiftUI

@main
struct weatherAppApp: App {
    var webService = WebService()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(webService)
        }
    }
}
