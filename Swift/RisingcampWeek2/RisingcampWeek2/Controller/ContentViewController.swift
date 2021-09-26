//
//  ContentViewController.swift
//  DiaryApp
//
//  Created by 박연배 on 2021/09/15.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var selectedDate: UILabel!
    
    @IBOutlet weak var selectedFeeling: UILabel!
    
    @IBOutlet weak var content: UITextView!
    
    @IBOutlet weak var placeholder: UILabel!
    
    @IBAction func feelingButtonClicked(_ sender: UIButton) {
        self.selectedFeeling.text = "선택한 기분: \(sender.titleLabel?.text ?? "error")"
    }
    
    @IBAction func goToPerv(_ sender: UIButton) {
        if !self.content.text.isEmpty && self.selectedFeeling.text?.last != "!" {
            let alert = UIAlertController(title: nil, message: "일기를 작성중입니다. 작성을 취소하시겠습니까?", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "예", style: .default) { _ in
                self.dismiss(animated: true, completion: nil)
            }
            let cancelButton = UIAlertAction(title: "아니오", style: .default, handler: nil)
            alert.addAction(okButton)
            alert.addAction(cancelButton)
            return self.present(alert, animated: true, completion: nil)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func setTodefalut(_ sender: Any) {
        let alert = UIAlertController(title: "삭제", message: "일기를 정말로 삭제하시겠습니까?", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "삭제", style: .default) { _ in
            self.selectedFeeling.text = "기분을 선택해주세요!"
            self.content.text = ""
            UserDefaults.standard.removeObject(forKey: "\(self.selectedDate.text!)")
            self.placeholderSetting()
            self.dismiss(animated: true)
        }
        let cancelButton = UIAlertAction(title: "취소", style: .default)
        alert.addAction(okButton)
        alert.addAction(cancelButton)
        
        return self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func editCompletion(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        let data = DiaryData(content: self.content.text, feeling: self.selectedFeeling.text ?? "!")
        
        
        if data.feeling.last == "!" {
            //감정 선택이 안된 것이므로, 경고창 띄우고 함수 종료
            let alert = UIAlertController(title: "", message: "감정을 선택해주세요", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            alert.addAction(okButton)
            print("DEBUG: Feeling is missing")
            return self.present(alert, animated: true, completion: nil)
        }
        
        // userDefault에 데이터 저장
        
        defaults.setValue(try? PropertyListEncoder().encode(data), forKey: "\(self.selectedDate.text!)")
        dismiss(animated: true, completion: nil)
        
    }
    
    func loadData() {
        if let data = UserDefaults.standard.value(forKey: "\(self.selectedDate.text!)") as? Data {
            self.data = try? PropertyListDecoder().decode(DiaryData.self, from: data)
            print(self.data!)
            self.content.text = self.data?.content
            self.selectedFeeling.text = self.data?.feeling
        }
    }
    
    func textViewConfigure() {
        // 자동완성, 맨 앞 글자 대문자 기능 off
        self.content.autocorrectionType = .no
        self.content.autocapitalizationType = .none
        self.content.delegate = self
    }
    
    
    
    
    var date: Date?
    var data: DiaryData?
    
    lazy var dateformatter: DateFormatter = {
        var df = DateFormatter()
        df.locale = Locale(identifier: "ko_KR")
        df.timeZone = TimeZone(identifier: "kst")
        df.dateFormat = "yyyy년 M월 d일"
        return df
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let date = date else { return }
        self.selectedDate.text = dateformatter.string(from: date)
        textViewConfigure()
        loadData()
        if self.content.text.isEmpty {
            placeholderSetting()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        
    }
    
}

extension ContentViewController: UITextViewDelegate {
    
    func placeholderSetting() {
        self.placeholder.isHidden = false
        self.placeholder.text = "\(self.selectedDate.text!)의 기분은 어떠셨나요?"
        self.placeholder.textColor = .gray
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if self.content.text.isEmpty {
            placeholderSetting()
        } else {
            self.placeholder.isHidden = true
        }
    }
}

extension ContentViewController {
    class var activityType: String {
        let activityType = ""
        if let activityTypes = Bundle.main.infoDictionary?["NSUserActivityTypes"] {
            if let activityArray = activityTypes as? [String] {
                return activityArray[0]
            }
            
        }
        return activityType

    }
    
    var detailUserActivity: NSUserActivity {
        let userActivity = NSUserActivity(activityType: ContentViewController.activityType)
        userActivity.title = "Restore Item"
        
        userActivity.addUserInfoEntries(from: ["title": self.title])
        return userActivity
    }
    
}
