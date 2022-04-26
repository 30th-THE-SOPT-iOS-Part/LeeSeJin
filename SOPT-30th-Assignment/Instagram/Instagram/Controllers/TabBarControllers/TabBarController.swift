//
//  TabBarController.swift
//  Instagram
//
//  Created by User on 2022/04/14.
//

import UIKit

class TabBarController: UITabBarController {
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setDelegate()
    }
    

    //MARK: - Helpers
    func setUI() {
        tabBar.unselectedItemTintColor = .black
    }
    
    func setDelegate() {
        self.delegate = self
    }
    
    func changeTabBarColor(toBlack: Bool){
        if toBlack {
            tabBar.backgroundColor = .black
            tabBar.tintColor = .white
            tabBar.unselectedItemTintColor = .white
        } else {
            tabBar.backgroundColor = .white
            tabBar.tintColor = .black
            tabBar.unselectedItemTintColor = .black
        }
    }
}

//MARK: - UITabBarControllerDelegate
extension TabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        let index = viewControllers?.firstIndex(of: viewController)
        
        (index == 2) ? changeTabBarColor(toBlack: true) : changeTabBarColor(toBlack: false)
        
        return true
    }
}
