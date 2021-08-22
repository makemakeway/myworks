//
//  ContentView.swift
//  weatherApp
//
//  Created by 박연배 on 2021/08/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var webService: WebService
    
    var body: some View {
        ScrollView {
            ZStack {
                Color(.systemTeal)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
                VStack {
                    Spacer()
                    
                    CurrentWeather()
                    
                    Spacer()
                }
            }
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
