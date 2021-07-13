//
//  CounterViewModel.swift
//  MVVMPractice
//
//  Created by 박연배 on 2021/07/13.
//

import Foundation
import SwiftUI

class CounterViewModel: ObservableObject {
    @Published private var counter: Counter = Counter()
    
   
    var value: Int {
        counter.count
    }

    var premium: Bool {
        counter.isPremium
    }
    
    
    func addCount() {
        self.counter.addCount()
    }
    
}
