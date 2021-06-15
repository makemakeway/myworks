//
//  LinkCell.swift
//  FaceBookMeSwiftUI
//
//  Created by 박연배 on 2021/06/15.
//

import SwiftUI

struct LinkCell: View {
    var cell: Cellinfo

    var body: some View {
        HStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image("\(cell.image)")
                    .padding(.horizontal, 6)
                
                Text("\(cell.text)")
                    .font(.body)
                
                Spacer()
            })
        }
        .padding(.vertical, 15)
        .padding(.horizontal)
    }
}

