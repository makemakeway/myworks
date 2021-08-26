//
//  CustomBorder.swift
//  weatherApp
//
//  Created by 박연배 on 2021/08/24.
//

import SwiftUI

struct CustomBorder: View {
    let borderwidth: CGFloat
    let borderheight: CGFloat
    
    var body: some View {
        Rectangle()
            .frame(width: borderwidth, height: borderheight)
            .foregroundColor(.orange)
    }
}
