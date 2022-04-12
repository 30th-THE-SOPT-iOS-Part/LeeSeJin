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
        nameTextField.clearButtonMode = .whileEditing
        passwordTextField.setIcon(Const.Image.password_shown)
        
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

    
    @IBAction func signupButtonDidTap(_ sender: UIButton) {
        guard let registrationController = UIStoryboard(name: Const.Storyboard.Registration, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.NameRegistrationController) as? NameRegistrationController else { return }
        
        self.navigationController?.pushViewController(registrationController, animated: true)
        
    }
    
}


