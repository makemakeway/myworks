//
//  NotificationView.swift
//  MySNS
//
//  Created by 박연배 on 2021/07/18.
//

import SwiftUI

struct NotificationView: View {
    @ObservedObject var notificationViewModel = NotificationViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 20) {
                ForEach(notificationViewModel.notifications) { notification in
                    
                    NotificationCell(viewModel: NotificationCellViewModel(notification: notification))
                        .padding(.top)
                    
                }
            }
        }
        
        .navigationBarTitle("활동", displayMode: .inline)
        
    }
}


