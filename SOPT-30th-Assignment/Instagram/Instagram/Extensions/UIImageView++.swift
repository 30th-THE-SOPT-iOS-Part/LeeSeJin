//
//  UIImageView++.swift
//  Instagram
//
//  Created by User on 2022/05/14.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(_ imageURL: URL) {
        self.kf.indicatorType = .activity
        self.kf.setImage(with: imageURL, options: [.transition(.fade(1))]) { result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("DEBUG: setting Image failed: \(error.localizedDescription)")
            }
        }
    }
}
