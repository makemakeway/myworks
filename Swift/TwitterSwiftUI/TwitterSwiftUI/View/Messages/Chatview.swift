//
//  Chatview.swift
//  TwitterSwiftUI
//
//  Created by 박연배 on 2021/06/10.
//

import SwiftUI

struct Chatview: View {
    @State var messageText: String = ""
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(MOCK_MESSAGES) { message in
                        MessageView(message: message)
                    }
                }
            }.padding()
            
            MessageInputView(messageText: $messageText)
                .padding()
        }
    }
}

struct Chatview_Previews: PreviewProvider {
    static var previews: some View {
        Chatview()
    }
}
