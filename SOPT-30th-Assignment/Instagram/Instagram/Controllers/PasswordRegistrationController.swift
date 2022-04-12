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
        setUI()
    }
    
    func setUI() {
        passwordTextField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        nextButton.setEnableStatus(enabled: false)
    }
    
    @IBAction func nextButtonDidTap(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: Const.Storyboard.LoginConfirm) as? LoginConfirmController else { return }
        
        nextVC.name = name
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true) {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? LoginConfirmController else { return }
        if let name = name {
            nextVC.name = name
        }
    }
    
    @objc func handleTextChange() {
        nextButton.setEnableStatus(enabled: passwordTextField.hasText)
    }
}

