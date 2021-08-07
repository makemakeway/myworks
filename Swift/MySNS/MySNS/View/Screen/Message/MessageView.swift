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
    @ObservedObject var viewModel: MessageViewModel
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
        .navigationBarTitleDisplayMode(.inline).toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    if user.profileImageUrl.isEmpty {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 36, height: 36)
                            .background(Color(.systemGray4))
                            .foregroundColor(.primary)
                            .cornerRadius(24)
                    } else {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 36, height: 36)
                            .cornerRadius(24)
                    }
                    
                    Text(user.userID)
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(Color.gray)
                }}}
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
