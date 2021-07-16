//
//  MessageView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/16.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
        HStack {
            Image("Venom")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20)
            VStack(alignment: .leading, spacing: 4) {
                Text("This is New Comment here")
                    .padding(.all, 10)
                    .foregroundColor(.primary)
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
            }
            Spacer(minLength: 0)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
