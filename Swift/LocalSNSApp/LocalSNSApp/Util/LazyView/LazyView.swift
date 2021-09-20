//
//  LazyView.swift
//  LocalSNSApp
//
//  Created by 박연배 on 2021/08/19.
//

import Foundation
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
