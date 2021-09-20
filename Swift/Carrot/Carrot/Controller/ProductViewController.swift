//
//  ProductViewController.swift
//  Carrot
//
//  Created by 박연배 on 2021/09/08.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBAction func dissMiss(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func goToHome(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc fileprivate func goBack(_ sender: Any) {
        print("pop")
        navigationController?.popViewController(animated: true)
    }
    
    var item: Item? = Item(image: "", title: "DEFAULT", region: "DEFAULT", price: "DEFAULT", likes: 0)
    
    var scrollView = UIScrollView()
    var itemImageView = UIImageView()
    var contentView = UIView()
    var backButton = UIButton(type: .custom)
    var homeButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.insetsLayoutMarginsFromSafeArea = false
        backButton.addTarget(self, action: #selector(goBack(_:)), for: .touchUpInside)
        print("\(item!)")
        // Do any additional setup after loading the view.
    }
    
    
    func homeButtonConfigure() {
        self.view.addSubview(homeButton)
        homeButton.setImage(UIImage(systemName: "house"), for: .normal)
        homeButton.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 15).isActive = true
        homeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.tintColor = .white
        homeButton.imageView?.contentMode = .scaleToFill
    }
    
    func backButtonConfigure() {
        self.view.addSubview(backButton)
        backButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.tintColor = .white
        backButton.imageView?.contentMode = .scaleToFill
    }
    
    func scrollViewConfigure() {
        self.view.addSubview(scrollView)
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        self.scrollView.contentSize = CGSize(width: view.frame.size.width, height: 2200)
        self.scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.scrollView.backgroundColor = .blue
    }
    
    
    
    func itemImageViewConfigure() {
        self.scrollView.addSubview(itemImageView)
        self.itemImageView.translatesAutoresizingMaskIntoConstraints = false
        self.itemImageView.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
        self.itemImageView.heightAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
//        self.itemImageView.topAnchor.constraint(equalTo: UIScreen.main.top).isActive = true
        self.itemImageView.image = UIImage(named: item?.image ?? "")
        self.itemImageView.contentMode = .scaleAspectFill
        self.itemImageView.backgroundColor = .red
        self.itemImageView.clipsToBounds = true
        
    }
    
    
    override func viewDidLayoutSubviews() {
        scrollViewConfigure()
        itemImageViewConfigure()
        backButtonConfigure()
        homeButtonConfigure()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("ProductView Will Appear")
        
        //탭바 숨김
        tabBarController?.tabBar.isHidden = true
        //Navigaton Bar 숨김
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.isTranslucent = false
        //navigation Border 없앰
        navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        //viewWillAppear에서 변경한 설정들을 원상복구
        tabBarController?.tabBar.isHidden = false
        navigationController?.navigationBar.shadowImage = nil
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.isNavigationBarHidden = false
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
