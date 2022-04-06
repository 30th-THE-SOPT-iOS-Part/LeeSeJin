//  ViewController.swift
//  Instagram
//
//  Created by User on 2022/04/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.setIcon(#imageLiteral(resourceName: "password_hidden_eye_icon"))
        }
    }
    
    @IBOutlet weak var forgotPasswordButton: UIButton!

    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 5
       // navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? LoginConfirmController else { return }
        
        nextVC.name = nameTextField.text
    }

}

