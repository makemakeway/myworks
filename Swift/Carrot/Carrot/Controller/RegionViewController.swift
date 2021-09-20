//
//  RegionViewController.swift
//  Carrot
//
//  Created by 박연배 on 2021/09/07.
//

import UIKit

class RegionViewController: UIViewController {

    var tv = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBarInit()
        tableViewConfigure()
        // Do any additional setup after loading the view.
    }
    
    func navBarInit() {
        self.view.addSubview(UINavigationBar.init())
        let titleFont = UIBarButtonItem(title: "구로제5동", style: UIBarButtonItem.Style.plain, target: self, action: nil)
        titleFont.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 18)!], for: UIControl.State.normal)
        navigationItem.leftBarButtonItem = titleFont
        self.navigationController?.navigationBar.isTranslucent = false
        
        let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: nil)
        let topicButton = UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .plain, target: self, action: nil)
        let alertButton = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: nil)
        
        navigationItem.setRightBarButtonItems([alertButton, topicButton, searchButton], animated: false)
        navigationController?.navigationBar.tintColor = .black
    }
    func setTableViewDelegate() {
        tv.delegate = self
        tv.dataSource = self
    }
    func tableViewConfigure() {
        view.addSubview(tv)
        setTableViewDelegate()
        tv.rowHeight = 200
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tv.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tv.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tv.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension RegionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "")
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}
