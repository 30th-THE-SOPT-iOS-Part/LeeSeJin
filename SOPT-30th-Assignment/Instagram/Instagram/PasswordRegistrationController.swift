//
//  File.swift
//  Instagram
//
//  Created by User on 2022/04/06.
//

import UIKit

class PasswordRegistrationController: UIViewController {
    
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? LoginConfirmController else { return }
        if let name = name {
            nextVC.name = name
        }
    }
    
}

