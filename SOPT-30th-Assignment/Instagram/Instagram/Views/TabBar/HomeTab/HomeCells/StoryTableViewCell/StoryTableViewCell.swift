//
//  StoryTableViewCell.swift
//  Instagram
//
//  Created by User on 2022/05/01.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    static let identifier = "StoryTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = .blue
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
