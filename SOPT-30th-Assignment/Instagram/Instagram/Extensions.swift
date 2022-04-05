//
//  Extensions.swift
//  Instagram
//
//  Created by User on 2022/04/06.
//

import UIKit

extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconButton = UIButton(frame: CGRect(x: 0, y: 5, width: 20, height: 20))
        iconButton.setImage(image, for: .normal)
        iconButton.addTarget(self, action: #selector(handleIconTapped), for: .touchUpInside)
        
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconButton)
        
        rightView = iconContainerView
        rightView?.tintColor = .gray
        rightViewMode = .always
    }
    
    @objc func handleIconTapped() {
        print("DEBUG: Handle button Tapped")
    }
}
