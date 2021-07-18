//
//  NotificationView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI

struct NotificationView: View {
    @Environment(\.presentationMode) var mode
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(0..<40) { _ in
                    NotificationCell()
                        .padding(.top)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                                    HStack {
                                        Button(action: { mode.wrappedValue.dismiss() }, label: {
                                            Image(systemName: "chevron.left")
                                        })
                                        Text("활동")
                                            .fontWeight(.semibold)
                                    }.font(.title2))
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
