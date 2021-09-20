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
    
    @IBAction func feelingButtonClicked(_ sender: UIButton) {
        self.selectedFeeling.text = "선택한 기분: \(sender.titleLabel?.text ?? "error")"
    }
    
    var date: Date?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
