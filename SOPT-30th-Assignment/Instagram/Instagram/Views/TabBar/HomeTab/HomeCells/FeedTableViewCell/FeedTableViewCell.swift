//
//  FeedTableViewCell.swift
//  Instagram
//
//  Created by User on 2022/05/01.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    static let identifier = "FeedTableViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var captionWriterNameLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentCountButton: UIButton!
    
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    //MARK: - Helpers
    
    func setData(feedData: FeedDataModel) {
        profileImageView.image = UIImage(named: feedData.profileImageName)
        profileNameLabel.text = feedData.profileName
        feedImageView.image = UIImage(named: feedData.feedImageName)
        likeCountLabel.text = "좋아요 \(feedData.likeCount)개"
        captionWriterNameLabel.text = feedData.profileName
        captionLabel.text = feedData.caption
        commentCountButton.setTitle("댓글 \(feedData.commentCount)개 모두 보기", for: .normal)
    }
    
    //MARK: - Actions
    @IBAction func likeButtonDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
}
