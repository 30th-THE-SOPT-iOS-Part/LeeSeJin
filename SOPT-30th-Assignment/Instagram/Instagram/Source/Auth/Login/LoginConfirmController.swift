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
            case .success(_):
                self.alert(withTitle: "회원가입 성공", message: "Instagram에 오신 것을 환영합니다.") { _ in
                    self.dismiss(animated: true)
                }
            case .requestErr(_):
                self.alert(withTitle: "회원 가입 실패", message: "이미 등록된 유저가 존재합니다.") { _ in
                    self.dismiss(animated: true)
                }
            case .pathErr:
                self.alert(withTitle: "회원가입 실패", message: "Can not decode...")
            case .serverErr:
                print("serverError")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
