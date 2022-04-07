//
//  LoginConfirmController.swift
//  Instagram
//
//  Created by User on 2022/04/06.
//

import UIKit


class LoginConfirmController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setName()
    }
    
    
    func setName() {
        if let name = name {
            welcomeLabel.text = "\(name)님 \n Instagram에 오신 것을 환영합니다"
            welcomeLabel.sizeToFit()
        }
    }
    
    @IBAction func confirmButtonDidTap(_ sender: UIButton) {
        guard let presentingVC = self.presentingViewController as? UINavigationController else { return }
        dismiss(animated: true) {
            presentingVC.popToRootViewController(animated: true)
        }

    }
}