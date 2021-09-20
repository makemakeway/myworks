//
//  ViewController.swift
//  DiaryApp
//
//  Created by 박연배 on 2021/09/15.
//

import UIKit
import FSCalendar

class ViewController: UIViewController {

    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var headerLabel: UILabel!
    
    private lazy var dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "ko_KR")
        df.dateFormat = "M월, yyyy"
        df.timeZone = TimeZone(identifier: "kst")
        return df
    }()
    
    @IBAction func prevButtonClicked(_ sender: Any) {
        scrollCurrentPage(isPrev: true)
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        scrollCurrentPage(isPrev: false)
    }
    
    private var currentPage: Date?
    private var today = Date()
    
    private func scrollCurrentPage(isPrev: Bool) {
        let cal = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = isPrev ? -1 : 1
        self.currentPage = cal.date(byAdding: dateComponents, to: self.currentPage ?? self.today)
        self.calendar.setCurrentPage(self.currentPage!, animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calendar.delegate = self
        calendar.dataSource = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setCalendar()
    }

}

extension ViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    // currentPage가 바뀔 때, 헤더 라벨도 수정
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        self.headerLabel.text = self.dateFormatter.string(from: calendar.currentPage)
    }
    
    
    func setCalendar() {
        calendar.headerHeight = 0
        calendar.scope = .month
        headerLabel.text = self.dateFormatter.string(from: calendar.currentPage)
        calendar.appearance.borderRadius = 0
        calendar.locale = Locale(identifier: "ko_KR")
        calendar.appearance.borderSelectionColor = .systemOrange
        calendar.appearance.selectionColor = .clear
        calendar.appearance.titleSelectionColor = .systemOrange
        calendar.appearance.titleTodayColor = .black
        calendar.appearance.titleWeekendColor = .systemPink
        calendar.appearance.weekdayTextColor = .darkGray
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        guard let modalPresentView = self.storyboard?.instantiateViewController(identifier: "TestViewController") as? ContentViewController else { return }
//        
//        self.present(modalPresentView, animated: true, completion: nil)
    }
    
}
