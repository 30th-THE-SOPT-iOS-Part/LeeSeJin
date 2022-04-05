//
//  SecondViewController.swift
//  Sopt_1
//
//  Created by User on 2022/04/02.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var dataLabel: UILabel!
    var message: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setMessage()

    }
    
    /*
     present - dismiss = modal
     push - pop = navigation
     
    */

    @IBAction func backButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        //navigationController?.popViewController(animated: true)
    }
    
    
    private func setMessage() {
        if let message = message {
            dataLabel.text = message
            dataLabel.sizeToFit()
        }
    }
}
