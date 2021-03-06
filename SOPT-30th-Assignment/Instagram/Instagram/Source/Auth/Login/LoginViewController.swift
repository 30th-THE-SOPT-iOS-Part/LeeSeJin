//  ViewController.swift
//  Instagram
//
//  Created by User on 2022/04/06.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    //MARK: - Helpers
    func setUI() {
        nameTextField.setIcon(Const.Image.clearCircle, for: .clear)
        nameTextField.rightViewMode = .whileEditing
        
        passwordTextField.setIcon(Const.Image.passwordShown, seletedImage: Const.Image.passwordHidden, for: .password_toggle)
        
        nameTextField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        
        loginButton.setEnableStatus(enabled: false)
        loginButton.layer.cornerRadius = 5
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? LoginConfirmController else { return }
        
        nextVC.name = nameTextField.text
    }
    
    
    //MARK: - Actions
    @objc func handleTextChange() {
        if let nameText = nameTextField.text{
            if let passwordText = passwordTextField.text {
                if nameText.isEmpty || passwordText.isEmpty {
                    loginButton.setEnableStatus(enabled: false)
                } else {
                    loginButton.setEnableStatus(enabled: true)
                }
            }
        }
    }

    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        login()
    }
    
    
    
    @IBAction func signupButtonDidTap(_ sender: UIButton) {
        guard let registrationController = UIStoryboard(name: Const.Storyboard.Registration, bundle: nil).instantiateViewController(withIdentifier: NameRegistrationController.reuseIdentifier) as? NameRegistrationController else { return }
        
        self.navigationController?.pushViewController(registrationController, animated: true)
    }
    
}


//MARK: - UserService

extension LoginViewController {
    func login() {
        guard let name = nameTextField.text else { return }
        let email = name
        guard let password = passwordTextField.text else { return }
        
        UserService.shared.login(name: name, email: email, password: password) { response in
            switch response {
            case .success(let data):
                guard let data = data as? LoginResponse else { return }
                if let name = data.data?.name {
                    self.alert(withTitle: "\(name)??? ???????????????.", message: "???????????? ?????????????????????.") { _ in
                        let tabBarController = TabBarController()
                        
                        //?????? ??????????????? ??????
                        guard let uWindow = self.view.window else { return }
                        uWindow.rootViewController = tabBarController
                        uWindow.makeKey()
                        UIView.transition(with: uWindow, duration: 0.5, options: [.transitionCrossDissolve], animations: {}, completion: nil)
                    }
                }
                
            case .requestErr(let data):
                guard let data = data as? LoginResponse else { return }
                let statusCode = data.status
                if statusCode == 404 {
                    self.alert(withTitle: "????????? ??????", message: "???????????? ???????????? ????????? ????????? ????????????.")
                } else {
                    self.alert(withTitle: "????????? ??????", message: "????????? ?????????????????????.")
                }
            case .pathErr:
                self.alert(withTitle: "????????? ??????", message: "Can not decode...")
            case .serverErr:
                print("serverError")
            case .networkFail:
                print("networkFail")
            }
        }
    }


}

