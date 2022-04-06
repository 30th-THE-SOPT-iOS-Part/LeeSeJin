//
//  NameRegistrationController.swift
//  Instagram
//
//  Created by User on 2022/04/06.
//

import UIKit

class NameRegistrationController: UIViewController {
    
    @IBOutlet weak var nameRegisterTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? PasswordRegistrationController else { return }
        
        nextVC.name = nameRegisterTextField.text
    }
    
}
