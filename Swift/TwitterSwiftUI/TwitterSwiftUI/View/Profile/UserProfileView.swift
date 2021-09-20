//
//  UserProfileView.swift
//  TwitterSwiftUI
//
//  Created by 박연배 on 2021/06/11.
//

import SwiftUI

struct UserProfileView: View {
    @State var selectedFilter: TwitterFilterOptions = .tweets
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderView()
                    .padding()
                
                FilterButtonView(selectedOption: $selectedFilter)
                    .padding()
            }
            .navigationTitle("batman")
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
