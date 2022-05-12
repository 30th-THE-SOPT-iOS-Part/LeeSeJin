//
//  UIViewController++.swift
//  Instagram
//
//  Created by User on 2022/05/01.
//

import UIKit

extension UIViewController {
    
    func hideNavigationBar(isHidden: Bool) {
        self.navigationController?.navigationBar.isHidden = isHidden
    }

    func alert(withTitle title: String, message: String, completion: @escaping(UIAlertAction) -> Void) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "확인", style: .default, handler: completion))
        present(alertVC, animated: true)
    }
    
    func alert(withTitle title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alertVC, animated: true)
    }
}
