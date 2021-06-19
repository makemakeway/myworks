//
//  TodoList.swift
//  TodoSwiftUI
//
//  Created by 박연배 on 2021/06/18.
//

import SwiftUI

struct TodoList: Identifiable {
    
    let id: String = UUID().uuidString
    var inputTitle: String
    var inputAddress: String
    var inputDescription: String
    var date: Date
}
