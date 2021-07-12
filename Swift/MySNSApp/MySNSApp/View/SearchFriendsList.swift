//
//  SearchBar.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/06/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchBarInput: String
    @Binding var searchBarClicked: Bool
    @Binding var searchToggle: Bool
    @State var profileClicked = false
    
    @ObservedObject var userViewModel: UserViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            // Search Bar Part
            HStack(spacing: 0) {
                
                ZStack(alignment: .leading) {
                    if searchBarInput.isEmpty {
                        Text("검색")
                            .foregroundColor(Color(.systemGray2))
                            .zIndex(1.0)
                            .padding(.horizontal, 48)
                    }
                    TextField("", text: $searchBarInput)
                        .frame(height: 40)
                        .padding(.horizontal, 48)
                        .background(Color(.systemGray5))
                        .clipShape(Capsule())
                        .autocapitalization(.none)
                    
                }
                
                .onTapGesture(perform: {
                    searchBarClicked = true
                })
                
                .overlay(HStack {
                    Image(systemName: "magnifyingglass")
                        .padding(.leading)
                    Spacer()
                })
                .padding(.horizontal)
                
                if searchBarClicked == true {
                    Button(action: {
                        searchBarClicked = false
                        searchBarInput = ""
                        searchToggle.toggle()
                    },
                    label: {
                        Text("취소")
                            .padding(.trailing)
                    })
                    .transition(AnyTransition.move(edge: .trailing))
                    .animation(.spring())
                }
            }
            .padding(.top)
            // Search List part
            
            List {
                ForEach(userViewModel.users) { user in
                    if authViewModel.userSession?.uid != user.id {
                        Button(action: { profileClicked.toggle() }, label: {
                            UserCell(user: user)
                        })
                        .fullScreenCover(isPresented: $profileClicked, content: {
                            ShowProfileView(profileClicked: $profileClicked, user: user)
                        })
                    }
                    
                }
            }
            .listStyle(PlainListStyle())
            
            Spacer()
        }
        
        
    }
}

//struct SearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBar(searchBarInput: .constant(""), searchBarClicked: .constant(true), searchToggle: .constant(false))
//            .preferredColorScheme(.dark)
//    }
//}
