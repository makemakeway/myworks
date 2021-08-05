//
//  MessageView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/26.
//

import Kingfisher
import SwiftUI

struct MessageView: View {
    let user: UserModel
    let viewModel: MessageViewModel
    @State var messageInput: String = ""
    @State var fieldClicked: Bool = false
    
    init(user: UserModel) {
        self.user = user
        self.viewModel = MessageViewModel(user: user)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    //상대방 메세지는 왼쪽, 내 메세지는 오른쪽 표시
                    ForEach(viewModel.messages) { message in
                        MessageCell(message: message)
                    }
                }
            }
            MessageTextField(input: $messageInput, onClicked: $fieldClicked, placeholder: "메시지 보내기...", action: sendMessage)
                .padding()
                .onTapGesture(perform: {
                    fieldClicked = true
                })
        }
    }
    func sendMessage() {
        viewModel.sendMessage(content: messageInput)
        messageInput = ""
    }
}

//struct MessageView_Previews: PreviewProvider {
//    static var previews: some View {
//        MessageView()
//    }
//}
