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
    var password: String?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setWelcomLabelText()
    }
    
    //MARK: - Helpers
    func setWelcomLabelText() {
        if let name = name {
            welcomeLabel.text = "\(name)님, Instagram에 오신 것을 환영합니다"
        }
    }
    
    //MARK: - Actions
    @IBAction func confirmButtonDidTap(_ sender: UIButton) {
        signUp()
//        let tabBarController = TabBarController()
//
//        //루트 뷰컨트롤러 변경
//        guard let uWindow = self.view.window else { return }
//        uWindow.rootViewController = tabBarController
//        uWindow.makeKey()
//        UIView.transition(with: uWindow, duration: 0.3, options: [.transitionCrossDissolve], animations: {}, completion: nil)
        
    }
    
    @IBAction func loginAnotherAccountButtonDidTap(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

//MARK: - UserService
extension LoginConfirmController {
    func signUp() {
        guard let name = name else { return }
        let email = name
        guard let password = password else { return }
        
        UserService.shared.signUp(name: name, email: email, password: password) { respose in
            switch respose {
            case .success(let data):
                guard let data = data as? SignUpResponse else { return }
                print(data)
            case .requestErr(let error):
                print(error)
            case .pathErr(let error):
                print(error)
            case .serverErr:
                print("serverError")
            case .networkFail:
                print("networkFail")
            }
        }
        
        
    }
}
