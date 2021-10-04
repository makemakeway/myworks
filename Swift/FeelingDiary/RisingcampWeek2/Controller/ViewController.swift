//
//  ViewController.swift
//  DiaryApp
//
//  Created by 박연배 on 2021/09/15.
//

import UIKit
import FSCalendar

class ViewController: UIViewController {

    
    // MARK: 프로퍼티
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var happyTotal: UILabel!
    @IBOutlet weak var delightTotal: UILabel!
    @IBOutlet weak var sadTotal: UILabel!
    @IBOutlet weak var madTotal: UILabel!
    @IBOutlet weak var tiredTotal: UILabel!
    @IBOutlet weak var sosoTotal: UILabel!
    var happy: Int = 0
    var soso: Int = 0
    var delight: Int = 0
    var sad: Int = 0
    var mad: Int = 0
    var tired: Int = 0
    
    
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
    
    private var currentPage: Date?
    private var today = Date()
    private var data: DiaryData?
    
    
    // MARK: 메소드
    @IBAction func prevButtonClicked(_ sender: Any) {
        scrollCurrentPage(isPrev: true)
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        scrollCurrentPage(isPrev: false)
    }
    
    private func scrollCurrentPage(isPrev: Bool) {
        let cal = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.month = isPrev ? -1 : 1
        self.currentPage = cal.date(byAdding: dateComponents, to: self.currentPage ?? self.today)
        self.calendar.setCurrentPage(self.currentPage!, animated: true)
    }
    
    func countTotal() -> Void {
        print("countTotal")
        self.tiredTotal.text = String(self.tired)
        self.sadTotal.text = String(self.soso)
        self.madTotal.text = String(self.mad)
        self.happyTotal.text = String(self.sad)
        self.sosoTotal.text = String(self.happy)
        self.delightTotal.text = String(self.delight)
        return
    }
    
    func setTotalDefault() {
        print("setDefalut")
        self.tired = 0
        self.soso = 0
        self.mad = 0
        self.sad = 0
        self.happy = 0
        self.delight = 0
        
        self.tiredTotal.text = String(self.tired)
        self.sadTotal.text = String(self.soso)
        self.madTotal.text = String(self.mad)
        self.happyTotal.text = String(self.sad)
        self.sosoTotal.text = String(self.happy)
        self.delightTotal.text = String(self.delight)
    }
    
    
    // MARK: 라이프사이클 메소드
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
        self.calendar.reloadData()
        setCalendar()
        setTotalDefault()
    }

    
}


// MARK: 델리게이트 메소드
extension ViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {

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
        calendar.appearance.titleDefaultColor = .label
        calendar.appearance.titleWeekendColor = .systemPink
        calendar.appearance.weekdayTextColor = .systemIndigo
        calendar.appearance.weekdayFont = UIFont(name: "Helvetica-Medium", size: 16)
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        calendar.appearance.todayColor = .clear
        calendar.appearance.titleTodayColor = .label
        calendar.scrollEnabled = false
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
                self.soso += 1
                self.sosoTotal.text = String(self.soso)
                return UIColor(named: "평범")
            case "😢":
                self.sad += 1
                self.sadTotal.text = String(self.sad)
                return UIColor(named: "슬픔")
            case "😡":
                self.mad += 1
                self.madTotal.text = String(self.mad)
                return UIColor(named: "분노")
            case "🥰":
                self.happy += 1
                self.happyTotal.text = String(self.happy)
                return UIColor(named: "행복")
            case "😊":
                self.delight += 1
                self.delightTotal.text = String(self.delight)
                return UIColor(named: "즐거움")
            case "😩":
                self.tired += 1
                self.tiredTotal.text = String(self.tired)
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
                return UIColor(named: "평범")
            case "😢":
                return UIColor(named: "슬픔")
            case "😡":
                return UIColor(named: "분노")
                
            case "🥰":
                return UIColor(named: "행복")
                
            case "😊":
                return UIColor(named: "즐거움")
                
            case "😩":
                return UIColor(named: "괴로움")
            default:
                return nil
            }
        }
        return nil
    }
    
    // currentPage가 바뀔 때, 헤더 라벨도 수정
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        self.headerLabel.text = self.dateFormatter.string(from: calendar.currentPage)
        print("scroll")
        setTotalDefault()
    }
    
}
