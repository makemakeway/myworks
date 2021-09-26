//
//  TutorialModel.swift
//  RisingcampWeek2
//
//  Created by 박연배 on 2021/09/22.
//

import Foundation

class Tutorial {
    static let shared = Tutorial()
    
    func isFirstRun() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isFirstRun")
    }
    
    func setTutorialCompleted() {
        UserDefaults.standard.set(true, forKey: "isFirstRun")
    }
    
    var contentTitle = ["Step 1", "Step 2", "Step 3", "Step 4", "Step 5"]
    var contentImages = ["page0", "page1", "page2", "page3", "page4"]
    var contentManual = ["일기를 작성하고 싶은 날짜를 선택해주세요!", "감정을 선택하고, 마음껏 일기를 작성해주세요!", "작성을 마친 뒤 완료를 누르면 감정과 일기가 저장됩니다.", "달력에서 작성한 날짜의 감정을 확인할 수 있습니다.", "선택한 감정에 따라 달력에 색이 채워집니다."]
    
    static var isFirst = "123456"
}
