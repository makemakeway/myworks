//
//  ContentView.swift
//  TodoSwiftUI
//
//  Created by 박연배 on 2021/06/16.
//

import SwiftUI

struct ContentView: View {
    @State var plusButtonToggled = false
    
    var body: some View {
        NavigationView {
            
            VStack {    
                List {
                    ForEach(0..<5) {index in
                        Text("")
                    }
                }
                .listStyle(PlainListStyle())

                .sheet(isPresented: $plusButtonToggled, content: {
                    MakeTodoView()
                })
            
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(trailing: Button(action: { self.plusButtonToggled.toggle() },
                                                     label: {Image(systemName: "plus")}))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
