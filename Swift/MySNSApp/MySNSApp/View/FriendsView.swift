//
//  FriendsView.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/06/25.
//

import SwiftUI

struct FriendsView: View {
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    VStack {
                        UserCell()
                            .padding(.top)
                        Divider()
                            .padding()
                        
                        ForEach(0..<20) { _ in
                            UserCell()
                            Divider()
                        }
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarItems(leading: Text("친구").font(.title2),
                                    trailing: Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                }))
            }
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
