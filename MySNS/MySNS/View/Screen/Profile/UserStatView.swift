//
//  UserStatView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI

struct UserStatView: View {
    var value: Int
    var title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .fontWeight(.bold)
            Text("\(title)")
        }
    }
}

//struct UserStatView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserStatView()
//    }
//}
