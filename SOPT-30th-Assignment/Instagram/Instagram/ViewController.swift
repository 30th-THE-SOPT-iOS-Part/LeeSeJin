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
        
        nameTextField.clearButtonMode = .whileEditing
        passwordTextField.setIcon(#imageLiteral(resourceName: "password_shown_eye_icon"))
        
        nameTextField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        
        loginButton.disable()
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
                    loginButton.disable()
                } else {
                    loginButton.enable()
                }
            }
        }
    }

}


