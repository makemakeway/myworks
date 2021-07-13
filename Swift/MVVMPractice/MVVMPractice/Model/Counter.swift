//
//  Counter.swift
//  MVVMPractice
//
//  Created by 박연배 on 2021/07/13.
//

import Foundation

struct Counter {
    var count: Int = 0
    var isPremium: Bool = false
    
    mutating func addCount() {
        self.count += 1
        
        if count.isMultiple(of: 3) {
            isPremium = true
        } else {
            isPremium = false
        }
    }
}
