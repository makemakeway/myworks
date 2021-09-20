//
//  CustomHomeTabbar.swift
//  Carrot
//
//  Created by 박연배 on 2021/09/09.
//

import UIKit

class CustomTC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = .black
        self.tabBar.unselectedItemTintColor = .black
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        
        homeVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        homeVC.tabBarItem.title = "홈"
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        
        let regionVC = RegionViewController()
        
        let aroundVC = AroundViewController()
        
        let chatVC = ChatViewController()
        
        let profileVC = ProfileViewController()
        
        viewControllers = [homeVC, regionVC, aroundVC, chatVC, profileVC]
        
        
    }
    
}
