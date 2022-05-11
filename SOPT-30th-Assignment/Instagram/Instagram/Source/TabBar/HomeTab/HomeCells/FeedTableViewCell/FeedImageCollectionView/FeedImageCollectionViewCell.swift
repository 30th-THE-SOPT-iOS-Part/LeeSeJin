//
//  FeedImageCollectionViewCell.swift
//  Instagram
//
//  Created by User on 2022/05/07.
//

import UIKit

class FeedImageCollectionViewCell: UICollectionViewCell {

    static let identifier = "FeedImageCollectionViewCell"
    
    @IBOutlet weak var feedImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(feedImage: String) {
        feedImageView.image = UIImage(named: feedImage)
    }
}
