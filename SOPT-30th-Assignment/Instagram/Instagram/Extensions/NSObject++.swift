//
//  NSObject++.swift
//  Instagram
//
//  Created by User on 2022/04/29.
//

import Foundation

extension NSObject {
    class var reuseIdentifier: String {
        return String(describing: self)
    }
}
