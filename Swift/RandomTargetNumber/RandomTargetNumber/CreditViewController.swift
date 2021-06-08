//
//  CreditViewController.swift
//  RandomTargetNumber
//
//  Created by 박연배 on 2021/06/08.
//

import UIKit

class CreditViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func touchUpDismissButton(_ sender: UIButton) {        //creditview에서 x버튼을 눌렀을 때 호출할 메서드
        dismiss(animated: true,
                completion: nil)
    }

    
}
