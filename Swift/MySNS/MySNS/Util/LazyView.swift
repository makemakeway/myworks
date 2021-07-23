//
//  LazyView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/22.
//

import SwiftUI

struct LazyView<Content: View>: View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
    
}
