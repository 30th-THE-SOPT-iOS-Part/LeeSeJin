//
//  StoryCollectionViewCell.swift
//  Instagram
//
//  Created by User on 2022/05/01.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    static let identifier = "StoryCollectionViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(storyData: StoryDataModel) {
        profileImageView.image = UIImage(named: storyData.profileImageName)
        profileNameLabel.text = storyData.profileName
    }
    
    
}
