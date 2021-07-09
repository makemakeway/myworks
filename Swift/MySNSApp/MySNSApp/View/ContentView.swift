//
//  ContentView.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/06/25.
//

import SwiftUI

struct ContentView: View {
//
    @ObservedObject var authViewModel = AuthViewModel()
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    
    
    var body: some View {
        
        
        if authViewModel.isSignedIn {
            DefaultView(authViewModel: authViewModel)
        } else {
            LoginView()
        }
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.dark)
//    }
//}
