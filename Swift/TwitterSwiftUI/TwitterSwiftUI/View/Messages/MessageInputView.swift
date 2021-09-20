//
//  MessageInputView.swift
//  TwitterSwiftUI
//
//  Created by 박연배 on 2021/06/10.
//

import SwiftUI

struct MessageInputView: View {
    @Binding var messageText: String
    var body: some View {
        HStack{
            TextField("Message", text: $messageText)
                .textFieldStyle(PlainTextFieldStyle())
            .frame(minHeight: 30)
        
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Send")
        })
        }
    }
}

struct MessageInputView_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputView(messageText: .constant("message...."))
    }
}
