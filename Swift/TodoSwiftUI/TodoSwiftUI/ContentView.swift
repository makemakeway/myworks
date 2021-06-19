//
//  ContentView.swift
//  TodoSwiftUI
//
//  Created by 박연배 on 2021/06/16.
//

import SwiftUI
struct ContentView: View {
    @State var plusButtonToggled = false
    @State var date = Date()
    @State var todoList = [TodoList]()
    @State var isActive = false
    
    
    
    
    var body: some View {
        NavigationView {
            List {
                
                ForEach(Array(todoList.enumerated()), id: \.offset) { (index, item) in
                    HStack {
                        Text(item.inputTitle)
                        Text(item.inputAddress)
                        Text(item.inputDescription)
                        Spacer()
                        Text(item.date, style: .date)
                    }
                    .frame(maxWidth: .infinity)
                    
                    .onTapGesture {
                        todoList.remove(at: index)
                    
                    }
                    
                    
                }
                
                
                
            }
            .ond
            .listStyle(PlainListStyle())
            
            
            .sheet(isPresented: $isActive, content: {
                MakeTodoView(
                    isActive: $isActive,
                    list: $todoList)
            })
            
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(trailing: Button(action: { isActive = true },
                                                 label: {Image(systemName: "plus")
                                                    .font(.system(size: 22))
                                                 }))
        }
    }
    func removeList(atOffset: Int) {
        todoList.remove(at: atOffset)
    }
}
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

