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
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            
            ContentView()
                .environmentObject(webService)
                .onChange(of: scenePhase) { phase in
                    switch phase {
                    case .background:
                        print("app is background")
                    case .active:
                        print("app is active")
                        DispatchQueue.main.async {
                            self.webService.getLocation()
                            self.webService.getWeather()
                        }
                    case .inactive:
                        print("app is inactive")
                    @unknown default:
                        print("unexpected value.")
                    }
                }
        }
    }
}
