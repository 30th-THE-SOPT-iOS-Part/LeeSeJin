//
//  FeedTableViewCell.swift
//  Instagram
//
//  Created by User on 2022/05/01.
//

import UIKit

protocol FeedTableViewCellDelegate: AnyObject {
    func cell(_ cell: FeedTableViewCell, wantsToLike: Bool)
}


class FeedTableViewCell: UITableViewCell {
    static let identifier = "FeedTableViewCell"
    
    weak var delegate: FeedTableViewCellDelegate?
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var feedImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var captionWriterNameLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentCountButton: UIButton!
    
    @IBOutlet weak var captionLabelWidth: NSLayoutConstraint!
    
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
        
        captionLabelWidth.constant = UIScreen.main.bounds.width - (captionWriterNameLabel.intrinsicContentSize.width + 12 + 4 + 12)
    }
    
    //MARK: - Actions
    @IBAction func likeButtonDidTap(_ sender: UIButton) {
        delegate?.cell(self, wantsToLike: !sender.isSelected)
    }
    
}
