//
//  FirstViewController.swift
//  Sopt_1
//
//  Created by User on 2022/04/02.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    @IBAction func goToSecondViewController(_ sender: Any) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        
        nextVC.message = dataTextField.text
        //navigationController?.pushViewController(nextVC, animated: true)
        nextVC.modalPresentationStyle = .fullScreen
        nextVC.modalTransitionStyle = .crossDissolve
        
        self.present(nextVC, animated: true, completion: nil)
        
    }
    
    
}
