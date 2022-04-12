//
//  CustomTabBarController.swift
//  Sopt_2
//
//  Created by User on 2022/04/09.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBarController()
    }
    
    // Helpers
    
    func setTabBarController() {
        // 1. 스토리보드에 있는 VC들을 안전하게 가져와서 인스턴스화
        guard let firstVC = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController"), let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
        else { return }
        
        // 2. 탭바 아이템 설정
        firstVC.tabBarItem = UITabBarItem(
            title: "First Tab",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        secondVC.tabBarItem = UITabBarItem(
            title: "Second Tab",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
    
        // 3. 연결
        setViewControllers([firstVC, secondVC], animated: true)
        
    }
}
