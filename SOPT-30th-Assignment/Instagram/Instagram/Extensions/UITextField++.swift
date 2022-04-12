//
//  UITextField++.swift
//  Instagram
//
//  Created by User on 2022/04/12.
//

import UIKit

enum ButtonIcon {
    case clear
    case password_toggle
}

extension UITextField {
    
    func setIcon(_ image: UIImage?, for iconType: ButtonIcon) {
        guard let image = image else { return }

        let iconButton = UIButton(frame: CGRect(x: 0, y: 5, width: 20, height: 20))
        iconButton.setImage(image, for: .normal)

        switch iconType {
        case .clear:
            iconButton.addTarget(self, action: #selector(handleClearIconTapped), for: .touchUpInside)
        case .password_toggle:
            iconButton.addTarget(self, action: #selector(handlePasswordIconTapped), for: .touchUpInside)
        }
        
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconButton)
        
        rightView = iconContainerView
        rightView?.tintColor = .gray
        rightViewMode = .always
    }
    
    @objc func handleClearIconTapped(_ sender: UIButton) {
        text = ""
    }
    
    @objc func handlePasswordIconTapped(_ sender: UIButton) {
        isSecureTextEntry ? sender.setImage(Const.Image.password_hidden, for: .normal) : sender.setImage(Const.Image.password_shown, for: .normal)

        isSecureTextEntry = !isSecureTextEntry

    }
    
    
}
