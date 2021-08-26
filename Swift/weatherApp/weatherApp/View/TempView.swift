//
//  TempView.swift
//  weatherApp
//
//  Created by 박연배 on 2021/08/26.
//

import SwiftUI

struct TempView: View {
    var body: some View {
        ZStack {
            Color(.systemIndigo)
                .blur(radius: 50, opaque: false)
        }.ignoresSafeArea()
    }
}
