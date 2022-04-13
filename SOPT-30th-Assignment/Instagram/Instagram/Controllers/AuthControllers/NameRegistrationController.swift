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
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    //MARK: - Helpers
    func setUI() {
        nextButton.setEnableStatus(enabled: false)
        nextButton.layer.cornerRadius = 5

        nameRegisterTextField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? PasswordRegistrationController else { return }
        
        nextVC.name = nameRegisterTextField.text
    }
    

    //MARK: - Actions
    @objc func handleTextChange() {
        nextButton.setEnableStatus(enabled: nameRegisterTextField.hasText)
    }
    
}
