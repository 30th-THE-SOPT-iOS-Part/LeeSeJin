//
//  Extensions.swift
//  Instagram
//
//  Created by User on 2022/04/06.
//

import UIKit

extension UIButton {
    
    func setEnableStatus(enabled: Bool) {
        isEnabled = enabled
        if isEnabled { backgroundColor = .link }
        else { backgroundColor = .lightGray }
    }
}
