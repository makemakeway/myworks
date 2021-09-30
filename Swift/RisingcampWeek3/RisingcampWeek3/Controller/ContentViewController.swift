//
//  ContentViewController.swift
//  RisingcampWeek3
//
//  Created by 박연배 on 2021/09/28.
//

import UIKit

class ContentViewController: UIViewController {

    //MARK: Property
    var data: Memo?
    
    @IBOutlet weak var memoDate: UILabel!
    @IBOutlet weak var memoContent: UITextView!
    @IBOutlet weak var memoTitle: UITextField!
    
    func dateToString(date: Date) -> String {
        let df = DateFormatter()
        df.timeZone = TimeZone(abbreviation: "KST")
        df.locale = Locale(identifier: "Ko_kr")
        df.dateFormat = "yyyy년 M월 d일 a h:m"
        return df.string(from: date)
    }
    
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if let data = data {
            memoDate.text = dateToString(date: data.date ?? Date())
            memoTitle.text = data.title ?? ""
            memoContent.text = data.content ?? ""
        }
        memoTitle.borderStyle = .none
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.tintColor = .systemOrange
    }
}
