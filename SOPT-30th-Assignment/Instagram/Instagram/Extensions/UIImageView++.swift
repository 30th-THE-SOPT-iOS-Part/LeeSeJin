//
//  UIImageView++.swift
//  Instagram
//
//  Created by User on 2022/05/14.
//

import UIKit

extension UIImageView {
    func urlToImg(_ imgURL: String) {
        let url = URL(string: imgURL)
        if url != nil {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.image = UIImage(data: data!)
                }
            }
        }
    }
}
