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

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    //MARK: - Helpers
    func setUI() {
        passwordTextField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        nextButton.setEnableStatus(enabled: false)
    }
    
    //MARK: - Actions
    @IBAction func nextButtonDidTap(_ sender: Any) {
        guard let LoginConfirmController = UIStoryboard(name: Const.Storyboard.Login, bundle: nil).instantiateViewController(withIdentifier: Const.ViewController.LoginConfirmController) as? LoginConfirmController else { return }
        
        LoginConfirmController.name = name
        LoginConfirmController.modalPresentationStyle = .fullScreen
        present(LoginConfirmController, animated: true) {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    
    @objc func handleTextChange() {
        nextButton.setEnableStatus(enabled: passwordTextField.hasText)
    }
}

