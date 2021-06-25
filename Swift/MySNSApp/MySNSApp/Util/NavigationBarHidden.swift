//
//  NavigationBarHidden.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/06/25.
//

import Foundation
import SwiftUI

struct NavigationBarHidden: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( NavigationBarHidden() )
    }
}
