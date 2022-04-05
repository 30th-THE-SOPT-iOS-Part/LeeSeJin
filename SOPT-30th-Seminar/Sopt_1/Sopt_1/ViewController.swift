//
//  ViewController.swift
//  Sopt_1
//
//  Created by User on 2022/04/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabel.text = "도착한 메세지가 없어요!"
        myLabel.textColor = .black
        myButton.backgroundColor = .lightGray
        myButton.tintColor = .white
        myButton.layer.cornerRadius = myButton.bounds.width / 2
    }

    @IBAction func doneButtonDidTap(_ sender: Any) {
        myLabel.text = "새로운 메세지가 도착했어요"
        myLabel.textColor = .systemMint
        
        
        
    }
    
    
    
}


