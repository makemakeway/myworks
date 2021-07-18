//
//  CommentView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/16.
//

import SwiftUI

struct CommentView: View {
    @State var commentInput = ""
    @State var commentFieldClicked = false
    @Environment(\.presentationMode) var mode
    
    
    
    var body: some View {
        VStack {
            ScrollView {
                Text("임시 댓글입니다.")
                Text("임시 댓글입니다.")
                Text("임시 댓글입니다.")
                Text("임시 댓글입니다.")
            }
            HStack {
                Image("SpiderMan")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40, alignment: .center)
                    .clipShape(Circle())
                
                CustomTextField(input: $commentInput, onClicked: $commentFieldClicked, placeholder: "댓글 달기...")
                    .padding(.horizontal, 6)
                    .onTapGesture(perform: {
                        commentFieldClicked = true
                    })
                    
                    
            }
            .padding(.all)
        }
        .navigationBarTitle(Text("댓글"), displayMode: .inline)
        .navigationBarItems(leading: Button(action: {
            mode.wrappedValue.dismiss()
        },
        label: {Image(systemName: "chevron.left").foregroundColor(.primary)}),
        trailing: Button(action: {
            //open comment ActionSheet
        },
        label: {Image(systemName: "ellipsis").foregroundColor(.primary)}))
        .navigationBarBackButtonHidden(true)
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CommentView()
                .preferredColorScheme(.dark)
        }
    }
}
