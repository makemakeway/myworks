//
//  FeedView.swift
//  LocalSNSApp
//
//  Created by 박연배 on 2021/08/16.
//

import SwiftUI
import CoreLocation

struct FeedView: View {
    @EnvironmentObject var location: CurrentLocation
    
    init() {
//        UINavigationBar.appearance().barTintColor = .systemBackground
    }
    
    var body: some View {
        ScrollView {
            ForEach(0..<10) { _ in
                NavigationLink(
                    destination: PostView(),
                    label: {
                        FeedCell()
                    })
                
                NavigationLink(
                    destination: EmptyView(),
                    label: {
                        EmptyView()
                    })
                
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(height: 0.4, alignment: .center)
                    .padding(.horizontal, 12)
                
            }
            
        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarItems(leading:
                                Text(location.location?.depthThreeAddr ?? "")
                                .font(.system(size: 18, weight: .heavy))
        )
        
    }
}

struct FeedView_Previews: PreviewProvider {
    @EnvironmentObject var location: CurrentLocation
    static var previews: some View {
        FeedView().environmentObject(CurrentLocation())
    }
}
