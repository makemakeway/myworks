//
//  Memo.swift
//  RisingcampWeek3
//
//  Created by 박연배 on 2021/09/28.
//

import Foundation

class Memo {
    var title: String?
    var content: String?
    var date: Date?
    
    init(title: String?, content: String?, date: Date?) {
        self.title = title
        self.content = content
        self.date = date
    }
}
