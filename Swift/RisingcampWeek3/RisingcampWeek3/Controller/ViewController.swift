//
//  ViewController.swift
//  RisingcampWeek3
//
//  Created by 박연배 on 2021/09/28.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Property
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var memoView: UITableView!
    
    var memoList = [Memo]()
    
    lazy var dateString: String = {
        let current = Date()
        let df = DateFormatter()
        df.timeZone = TimeZone(abbreviation: "KST")
        df.locale = Locale(identifier: "Ko_kr")
        df.dateFormat = "yyyy. M. d."
        return df.string(from: current)
    }()
    
    
    
    //MARK: Function
    func addMockMemo() {
        memoList.append(Memo(title: "제목1", content: "내용1", date: Date()))
        memoList.append(Memo(title: "제목2", content: "내용2", date: Date()))
        memoList.append(Memo(title: "제목3", content: "내용3", date: Date()))
        memoList.append(Memo(title: "제목4", content: "내용4", date: Date()))
        memoList.append(Memo(title: "제목5", content: "내용5", date: Date()))
        memoList.append(Memo(title: "제목6", content: "내용6", date: Date()))
        memoList.append(Memo(title: "제목7", content: "내용7", date: Date()))
    }
    
    func dateToString(date: Date) -> String {
        let df = DateFormatter()
        df.timeZone = TimeZone(abbreviation: "KST")
        df.locale = Locale(identifier: "Ko_kr")
        df.dateFormat = "yyyy. M. d."
        return df.string(from: date)
    }
    
    func tableViewConfig() {
        self.memoView.delegate = self
        self.memoView.dataSource = self
        let cell = UINib(nibName: "MemoCell", bundle: nil)
        self.memoView.register(cell, forCellReuseIdentifier: "MemoCell")
    }
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBarConfig()
        self.addMockMemo()
        tableViewConfig()
    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.title = "메모"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
    }
    
    
    
    //MARK: UI Configuration
    
    func searchBarConfig() {
        self.searchBar.autocorrectionType = .no
        self.searchBar.autocapitalizationType = .none
        self.searchBar.placeholder = "검색"
        self.searchBar.searchBarStyle = .minimal
        self.searchBar.setTextFieldColor(UIColor.green)
    }
}


//MARK: Table View Delegate

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemoCell", for: indexPath) as? MemoCell else {
            return UITableViewCell()
        }
        
        let data = memoList[indexPath.row]
        cell.content.text = data.content
        cell.title.text = data.title
        cell.date.text = dateToString(date: data.date ?? Date())
        cell.backgroundColor = .systemGray6
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ContentViewController") as! ContentViewController
        vc.data = memoList[indexPath.row]

        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: UISearchBar 텍스트필드 영역 색깔을 바꿔주기 위한 extension
extension UISearchBar {
    func setTextFieldColor(_ color: UIColor) {
        for subView in self.subviews {
            for subSubView in subView.subviews {
                let view = subSubView as? UITextInputTraits
                if view != nil {
                    let textField = view as? UITextField
                    textField?.backgroundColor = color
                    break
                }
            }
        }
    }
}
