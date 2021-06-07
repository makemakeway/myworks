//
//  ViewController.swift
//  HelloSwiftProject
//
//  Created by 박연배 on 2021/06/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputField:
        UITextField!
    
    @IBAction func showValue(_ sender: Any) {
        
        guard  let value = inputField.text else {
            return
        }
        let alert = UIAlertController(title: "확인", message: value, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "확인", style: .default, handler: nil)
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

