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
                ForEach(todoList, id: \.self) { item in
                    HStack(spacing: 28) {
                        Text(item.inputTitle)
                        Text(item.inputAddress)
                        Text(item.inputDescription)
                        Spacer()
                        Text(item.date, style: .date)
                    }
                    .frame(maxWidth: .infinity)
                }
                .onDelete(perform: removeList) // 왼쪽으로 드래그하면 Delete버튼이 드러나고, 버튼을 누르면 removeList 함수를 수행
            }
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
    func removeList(at offset: IndexSet) {
        todoList.remove(atOffsets: offset)
    }
}
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

