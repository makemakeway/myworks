//
//  BoardView.swift
//  TetrisGameApp
//
//  Created by 박연배 on 2021/08/31.
//

import SwiftUI

struct BoardView: View {
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Rectangle().stroke(Color.gray, lineWidth: 5)
            .frame(width: self.width, height: self.height)
            .padding(.horizontal)
            .padding(.top, 40)
    }
}

