//
//  CommentView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/16.
//

import SwiftUI
import Kingfisher

struct CommentView: View {
    @State var commentInput = ""
    @State var commentFieldClicked = false
//    @Environment(\.presentationMode) var mode
    @ObservedObject var commentViewModel: CommentViewModel
    
    
    
    var body: some View {
        VStack {
            // MARK: 댓글 출력 부분
            CommentList(commentViewModel: commentViewModel)
            
            HStack {
                if let user = AuthViewModel.shared.currentUser {
                    if user.profileImageUrl.isEmpty {
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40, alignment: .center)
                            .background(Color(.systemGray4))
                            .clipShape(Circle())
                    } else {
                        KFImage(URL(string: user.profileImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40, alignment: .center)
                            .clipShape(Circle())
                    }
                }
                
                // MARK: 댓글 입력 부분
                CustomTextField(input: $commentInput, onClicked: $commentFieldClicked, placeholder: "댓글 달기...", action: uploadComment)
                    .padding(.horizontal, 6)
                    .onTapGesture(perform: {
                        commentFieldClicked = true
                    })
                    
                    
            }
            .padding(.all)
        }
        .navigationBarTitle(Text("댓글"), displayMode: .inline)
        
    
    }
    func uploadComment() {
        commentViewModel.uploadComment(comment: commentInput)
        commentInput = ""
    }
}

