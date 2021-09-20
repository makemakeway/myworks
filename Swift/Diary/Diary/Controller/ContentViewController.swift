//
//  ContentViewController.swift
//  Diary
//
//  Created by 박연배 on 2021/09/15.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var selectedDate: UILabel!
    @IBOutlet weak var selectedFeeling: UILabel!
    @IBOutlet weak var content: UITextView!
    var data = DiaryData(content: "", feeling: "")
    
    
    @IBAction func feelingButtonClicked(_ sender: UIButton) {
        self.feelingSelected = true
        self.selectedFeeling.text = "선택한 기분: \(sender.titleLabel?.text ?? "error")"
    }

    @IBAction func commitButtonClicked(_ sender: Any) {
        let defaults = UserDefaults.standard
        data.content = content.text
        data.feeling = selectedFeeling.text!
        defaults.set(data, forKey: "\(selectedDate.text ?? "")")
    }
    
    
    @IBAction func dissMissButtonClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    var feelingSelected: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
