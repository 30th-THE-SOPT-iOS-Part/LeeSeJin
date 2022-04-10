//
//  NameRegistrationController.swift
//  Instagram
//
//  Created by User on 2022/04/06.
//

import UIKit

class NameRegistrationController: UIViewController {
    
    @IBOutlet weak var nameRegisterTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    func setUI() {
        nextButton.setEnableStatus(enabled: false)
        nameRegisterTextField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? PasswordRegistrationController else { return }
        
        nextVC.name = nameRegisterTextField.text
    }
    

    
    @objc func handleTextChange() {
        nextButton.setEnableStatus(enabled: nameRegisterTextField.hasText)
    }
}
