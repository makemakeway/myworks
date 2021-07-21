//
//  NotificationView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI

struct NotificationView: View {
    @Environment(\.presentationMode) var mode
    @ObservedObject var notificationViewModel = NotificationViewModel()
    
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(notificationViewModel.notifications) { notification in
                    NotificationCell(notification: notification)
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

