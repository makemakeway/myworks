//
//  LocalSNSAppApp.swift
//  LocalSNSApp
//
//  Created by 박연배 on 2021/08/16.
//

import SwiftUI

@main
struct LocalSNSAppApp: App {
    var location = CurrentLocation()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(location)
        }
    }
}
