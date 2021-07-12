//
//  SearchEmailView.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/07/12.
//

import SwiftUI

struct SearchEmailView: View {
    @State var searchText: String = ""
    @State var searchBarToggle = false
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                HStack {
                    CustomTextField(text: $searchText, placeholder: Text("친구 이메일").foregroundColor(.gray), imageName: "magnifyingglass")
                        .background(Color(.systemGray3))
                        .clipShape(Capsule())
                        .onTapGesture(perform: {
                            searchBarToggle = true
                        })
                    
                    Spacer()
                    
                    if searchBarToggle {
                        Button(action: {}, label: {
                            Text("검색")
                        })
                        .transition(.move(edge: .trailing))
                        .animation(.spring())
                    }
                }
                Spacer()
            }
            .padding()
            .navigationBarItems(leading:
                                    Button(action: { mode.wrappedValue.dismiss() },
                                           label: { Image(systemName: "xmark")}))
            .navigationBarTitle(Text("이메일로 친구 추가"), displayMode: .inline)
        }
        
        
        
    }
}

struct SearchEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SearchEmailView()
    }
}
