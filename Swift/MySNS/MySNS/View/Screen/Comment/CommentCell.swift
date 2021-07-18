//
//  MessageView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/16.
//

import SwiftUI

struct CommentCell: View {
//    @State var commentModel: CommentModel
    
    var body: some View {
        HStack {
            Image("Venom")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40, alignment: .center)
                .cornerRadius(20)
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text("UserName")
                        .foregroundColor(.primary)
                        .font(.callout)
                        .fontWeight(.medium)
                    
                    Text("This is New Comment hereeeeeeee")
                        .foregroundColor(.primary)
                }
                
            }
            Spacer(minLength: 0)
        }
    }
}

struct MessageView_Previews: PreviewProvider {
//    static var comment: CommentModel = CommentModel(commentID: <#T##String#>, userID: <#T##String#>, userName: <#T##String#>, content: <#T##String#>, dateCreated: <#T##Date#>)
    
    static var previews: some View {
        CommentCell()
    }
}
