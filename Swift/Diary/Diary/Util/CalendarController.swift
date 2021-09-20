//
//  CalendarMaker.swift
//  Diary
//
//  Created by 박연배 on 2021/09/14.
//

import Foundation
import UIKit

class CalendarController {
    let calendar = Calendar.current
    
    // MARK: 월 이동
    func addMonth(date: Date) -> Date {
        return calendar.date(byAdding: .month, value: 1, to: date)!
    }
    func minusMonth(date: Date) -> Date {
        return calendar.date(byAdding: .month, value: -1, to: date)!
    }
    
    func addYear(date: Date) -> Date {
        return calendar.date(byAdding: .year, value: 1, to: date)!
    }
    func minusYear(date: Date) -> Date {
        return calendar.date(byAdding: .year, value: -1, to: date)!
    }
    
    // MARK: main Label content
    func monthString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "LLLL"
        
        return dateFormatter.string(from: date)
    }
    func yearString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    // MARK: 매개변수로 받는 Date의 월이 며칠까지 있는지 반환
    func daysInMonth(date: Date) -> Int {
        let range = calendar.range(of: .day, in: .month, for: date)!
        print(range)
        return range.count
    }
    
    
    // MARK: 매개변수로 받는 Date의 일 반환
    func dayOfMonth(date: Date) -> Int {
        let components = calendar.dateComponents([.day], from: date)
        return components.day!
    }
    // MARK: 매개변수로 받는 요일 반환
    func weekDay(date: Date) -> Int {
        let components = calendar.dateComponents([.weekday], from: date)
        return components.weekday! - 1
        // weekday 속성은 0이 일요일, 6이 토요일
    }
    
    func firstOfMonth(date: Date) -> Date {
        let components = calendar.dateComponents([.year, .month], from: date)
        print(calendar.date(from: components)!)
        return calendar.date(from: components)!
    }
}
