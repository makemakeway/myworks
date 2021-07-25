//
//  MakeTodoView.swift
//  TodoSwiftUI
//
//  Created by 박연배 on 2021/06/16.
//

import SwiftUI

struct MakeTodoView: View {
    @Binding var isActive: Bool
    @Binding var list: [TodoList]
    @State var inputTitle = ""
    @State var inputAddress = ""
    @State var inputDescription = ""
    @State var date = Date()
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            // Input Part
            VStack(spacing: 30) {
                TextField("Title", text: $inputTitle)
                    .frame(width: 200, height: 48, alignment: .center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                TextField("Address", text: $inputAddress)
                    .frame(width: 200, height: 48, alignment: .center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                TextField("Description", text: $inputDescription)
                    .frame(width: 200, height: 48, alignment: .center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
            }
            .padding(.top, 70)
            .padding(.bottom, 30)
            
            
            // Select Date Part
            HStack {
                Spacer()
                Text("Date")
                    .font(.title3)
                Spacer()
            }
            DatePicker("Date", selection: $date, in: Date()..., displayedComponents: .date)
                .labelsHidden()
            
            // Cancel or Save
            HStack {
                Button(action: { isActive = false },
                       label: {
                        Text("Cancel")
                       })
                    .foregroundColor(.red)
                Spacer()
                Button(action: {
                        list.append(TodoList(inputTitle: inputTitle, inputAddress: inputAddress, inputDescription: inputDescription, date: date))
                        isActive = false},
                       label: {
                        Text("Save")
                       })
            }
            .padding(.horizontal, 80)
            Spacer()
        }
        .padding()
        
        
    }
}

