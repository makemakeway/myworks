//
//  test.swift
//  MySNSApp
//
//  Created by 박연배 on 2021/07/12.
//

import SwiftUI

struct DemoActionSheetNavi: View {

    @State private var showingSheet = false
    @State private var showingHelp = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Test")
                Button("Tap me") { self.showingSheet = true }
                NavigationLink(destination: HelpView(),
                               isActive: $showingHelp) {
                    EmptyView()
                }
            }
            
        }
        .actionSheet(isPresented: $showingSheet) {
            ActionSheet(
                title: Text("What do you want to do?"),
                message: Text("There's only one choice..."),
                buttons: [.cancel(),
                          .default(Text("Go to help")) {
                            self.showingSheet = false
                            self.showingHelp = true
                    }])
        }
        
        
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        DemoActionSheetNavi()
    }
}
