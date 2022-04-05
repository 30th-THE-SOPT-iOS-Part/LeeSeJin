//#imageLiteral(resourceName: "password_hidden_eye_icon.png")#imageLiteral(resourceName: "password_hidden_eye_icon2x.png")#imageLiteral(resourceName: "password_hidden_eye_icon3x.png")
//  ViewController.swift
//  Instagram
//
//  Created by User on 2022/04/06.
//

import UIKit

class ViewController: UIViewController {
    
    
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
    }


}

