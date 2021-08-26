//
//  InfoCell.swift
//  weatherApp
//
//  Created by 박연배 on 2021/08/24.
//

import SwiftUI

struct InfoCell: View {
    let placeholder: String
    let info: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(placeholder)")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.orange)
            Text("\(info)")
                .font(.system(size: 32, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
