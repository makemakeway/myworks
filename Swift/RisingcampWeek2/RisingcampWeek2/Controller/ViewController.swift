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
    
    private lazy var dfForBackgrond: DateFormatter = {
        let df = DateFormatter()
        df.locale = Locale(identifier: "ko_KR")
        df.timeZone = TimeZone(identifier: "kst")
        df.dateFormat = "yyyy년 M월 d일"
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
    private var data: DiaryData?
    
    private func scrollCurrentPage(isPrev: Bool) {
        let cal = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = isPrev ? -1 : 1
        self.currentPage = cal.date(byAdding: dateComponents, to: self.currentPage ?? self.today)
        self.calendar.setCurrentPage(self.currentPage!, animated: true)
        
    }
    
    override func viewDidLayoutSubviews() {
        if Tutorial.shared.isFirstRun() {
            let vc = storyboard?.instantiateViewController(withIdentifier: "Tutorial") as! TutorialContentsViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calendar.delegate = self
        calendar.dataSource = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        self.calendar.reloadData()
        setCalendar()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
        
    }

}

extension ViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    // currentPage가 바뀔 때, 헤더 라벨도 수정
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        self.headerLabel.text = self.dateFormatter.string(from: calendar.currentPage)
        
    }
    
    
    func setCalendar() {
        calendar.heightAnchor.constraint(equalToConstant: self.view.frame.size.height / 2).isActive = true
        calendar.headerHeight = 0
        calendar.scope = .month
        headerLabel.text = self.dateFormatter.string(from: calendar.currentPage)
        calendar.appearance.borderRadius = 5
        calendar.locale = Locale(identifier: "ko_KR")
        calendar.appearance.borderSelectionColor = .systemOrange
        calendar.appearance.selectionColor = .clear
        calendar.appearance.titleSelectionColor = .systemOrange
        calendar.appearance.titleTodayColor = .black
        calendar.appearance.titleWeekendColor = .systemPink
        calendar.appearance.weekdayTextColor = .darkGray
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        calendar.appearance.todayColor = .clear
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        guard let modalPresentView = self.storyboard?.instantiateViewController(identifier: "ContentViewController") as? ContentViewController else { return }
        // modalView에 내가 누른 날짜 정보 넣어주기
        modalPresentView.date = date
        modalPresentView.modalPresentationStyle = .fullScreen
        self.present(modalPresentView, animated: true, completion: nil)
    }
    
    
    
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        if dfForBackgrond.string(from: date) == dfForBackgrond.string(from: Date()) {
            calendar.appearance.subtitleTodayColor = .gray
            return "오늘"
        }
        return nil
    }
    
    
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        if let data = UserDefaults.standard.value(forKey: "\(dfForBackgrond.string(from: date))") as? Data {
            self.data = try? PropertyListDecoder().decode(DiaryData.self, from: data)
            switch self.data?.feeling.last {
            case "😐":
                print("평범한 감정 \(date)")
                return UIColor(named: "평범")
            
            case "😢":
                print("슬픈 감정 \(date)")
                return UIColor(named: "슬픔")
            case "😡":
                print("화난 감정 \(date)")
                return UIColor(named: "분노")
                
            case "🥰":
                print("행복한 감정 \(date)")
                return UIColor(named: "행복")
                
            case "😊":
                print("즐거운 감정 \(date)")
                return UIColor(named: "즐거움")
                
            case "😩":
                print("괴로운 감정 \(date)")
                return UIColor(named: "괴로움")
            default:
                return nil
            }
        }
        return nil
    }
    
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
        if let data = UserDefaults.standard.value(forKey: "\(dfForBackgrond.string(from: date))") as? Data {
            self.data = try? PropertyListDecoder().decode(DiaryData.self, from: data)
            switch self.data?.feeling.last {
            case "😐":
                print("평범한 감정 \(date)")
                return UIColor(named: "평범")
            
            case "😢":
                print("슬픈 감정 \(dfForBackgrond.string(from: date))")
                return UIColor(named: "슬픔")
            case "😡":
                print("화난 감정 \(date)")
                return UIColor(named: "분노")
                
            case "🥰":
                print("행복한 감정 \(date)")
                return UIColor(named: "행복")
                
            case "😊":
                print("즐거운 감정 \(date)")
                return UIColor(named: "즐거움")
                
            case "😩":
                print("괴로운 감정 \(date)")
                return UIColor(named: "괴로움")
            default:
                return nil
            }
        }
        return nil
    }
    
}
