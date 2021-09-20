//
//  HomeViewController.swift
//  CarrotMarket
//
//  Created by 박연배 on 2021/09/07.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navBarInit()
        // Do any additional setup after loading the view.
    }
    
    func navBarInit() {
        let titleFont = UIBarButtonItem(title: "구로제5동", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        titleFont.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Medium", size: 20)!], for: UIControl.State.normal)
        navigationItem.leftBarButtonItem = titleFont
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    @IBAction func magButtonToggled() {
        print("magButtonToggled")
    }
    @IBAction func testAction(_ sender: Any) {
        print("magButtonToggled")
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
