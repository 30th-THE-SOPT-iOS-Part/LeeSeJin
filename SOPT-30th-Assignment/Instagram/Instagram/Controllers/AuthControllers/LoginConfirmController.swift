//
//  LoginConfirmController.swift
//  Instagram
//
//  Created by User on 2022/04/06.
//

import UIKit


class LoginConfirmController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    var name: String?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setName()
    }
    
    //MARK: - Helpers
    func setName() {
        if let name = name {
            welcomeLabel.text = "\(name)님, Instagram에\n 오신 것을 환영합니다"
            welcomeLabel.sizeToFit()
        }
        confirmButton.layer.cornerRadius = 5

    }
    
    //MARK: - Actions
    @IBAction func confirmButtonDidTap(_ sender: UIButton) {
        let tabBarController = TabBarController()
        
        //루트 뷰컨트롤러 변경
        guard let uWindow = self.view.window else { return }
        uWindow.rootViewController = tabBarController
        uWindow.makeKey()
        UIView.transition(with: uWindow, duration: 0.3, options: [.transitionCrossDissolve], animations: {}, completion: nil)
        
    }
    
    @IBAction func loginAnotherAccountButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

