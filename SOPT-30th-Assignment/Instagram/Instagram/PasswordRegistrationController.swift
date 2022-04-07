//
//  File.swift
//  Instagram
//
//  Created by User on 2022/04/06.
//

import UIKit

class PasswordRegistrationController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    var name: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        nextButton.isEnabled = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? LoginConfirmController else { return }
        if let name = name {
            nextVC.name = name
        }
    }
    
    @objc func handleTextChange() {
        if let passwordText = passwordTextField.text {
            if passwordText.isEmpty {
                nextButton.isEnabled = false
            } else {
                nextButton.isEnabled = true
            }
        }
    }
}

