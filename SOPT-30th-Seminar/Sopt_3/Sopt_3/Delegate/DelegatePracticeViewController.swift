//
//  DelegatePracticeViewController.swift
//  Sopt_3
//
//  Created by User on 2022/04/23.
//

import UIKit

class DelegatePracticeViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var dataLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
    }


    @IBAction func nextButtonDidTap(_ sender: Any) {
        guard let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
        secondVC.delegate = self
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
}


extension DelegatePracticeViewController: UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("편집 시작")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("리턴 버튼 클릭")
        textField.endEditing(true)
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("편집 끝")
    }
}


extension DelegatePracticeViewController: SecondViewControllerDelegate {
    func sendData(data: String) {
        dataLabel.text = data
    }
    
    
}
