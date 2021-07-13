//
//  ContentView.swift
//  MVVMPractice
//
//  Created by 박연배 on 2021/07/13.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var counterViewModel: CounterViewModel
    
    init() {
        counterViewModel = CounterViewModel()
    }
    
    var body: some View {
        VStack {
            Text(counterViewModel.premium ? "Premium" : "")
                .foregroundColor(Color(.systemIndigo))
                .font(.largeTitle)
                .frame(width: 200, height: 100)
            
            Text("\(counterViewModel.value)")
                .font(.title)
            
            Button("증가") {
                counterViewModel.addCount()
            }
        }
    }
}

