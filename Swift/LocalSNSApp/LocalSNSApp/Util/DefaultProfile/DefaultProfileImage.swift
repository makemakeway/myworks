//
//  DefaultProfileImage.swift
//  LocalSNSApp
//
//  Created by 박연배 on 2021/08/18.
//

import SwiftUI

struct DefaultProfileImage: View {
    let length: CGFloat
    
    var body: some View {
        Image(systemName: "person.fill")
            .resizable()
            .scaledToFill()
            .frame(width: length, height: length)
            .foregroundColor(Color(.systemGray3))
            .background(Color.gray)
            .clipShape(Circle())
    }
}
