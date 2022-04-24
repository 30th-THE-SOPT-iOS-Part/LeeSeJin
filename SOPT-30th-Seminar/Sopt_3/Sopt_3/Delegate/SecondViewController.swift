//
//  SecondViewController.swift
//  Sopt_3
//
//  Created by User on 2022/04/23.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func sendData(data: String)
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var dataTextField: UITextField!
    
    weak var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendDataButtonDidTap(_ sender: Any) {
        if let text = dataTextField.text {
            delegate?.sendData(data: text)
        }
        self.navigationController?.popViewController(animated: true)
    }
}
