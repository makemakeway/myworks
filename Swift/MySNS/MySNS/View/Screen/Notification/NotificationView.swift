//
//  NotificationView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI

struct NotificationView: View {
    @StateObject var notificationViewModel = NotificationViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(notificationViewModel.notifications) { notification in
                    
                    LazyView(NotificationCell(viewModel: NotificationCellViewModel(notification: notification)))
                        .padding(.top)
                        
                    
                }
            }
            .onAppear {
                notificationViewModel.fetchNofitication()
            }
        }
        
        .navigationBarTitle("활동", displayMode: .inline)
        
    }
}


