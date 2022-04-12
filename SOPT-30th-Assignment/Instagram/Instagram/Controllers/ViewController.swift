//  ViewController.swift
//  Instagram
//
//  Created by User on 2022/04/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!

    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
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

}


