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
    
    var model: FeedDataModel? {
        didSet {
            guard let model = model else { return }
            setData(feedData: model)
        }
    }
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentCountButton: UIButton!
        
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setDelegate()
        configureCollectionView()
    }

    //MARK: - Helpers
    func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func configureCollectionView() {
        let nib = UINib(nibName: FeedImageCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: FeedImageCollectionViewCell.identifier)
    }

    func setData(feedData: FeedDataModel) {
        profileImageView.image = UIImage(named: feedData.profileImageName)
        profileNameLabel.text = feedData.profileName
        
        likeCountLabel.text = "좋아요 \(feedData.likeCount)개"
        captionLabel.attributedText = attributedCaptionText(username: feedData.profileName, caption: feedData.caption)
        commentCountButton.setTitle("댓글 \(feedData.commentCount)개 모두 보기", for: .normal)
        
        collectionView.reloadData()
        pageControl.numberOfPages = feedData.feedImageName.count
    }
    
    func attributedCaptionText(username: String, caption: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "\(username) ", attributes: [.font: UIFont.systemFont(ofSize: 12, weight: .medium)])
        attributedText.append(NSAttributedString(string: caption, attributes: [.font: UIFont.systemFont(ofSize: 10)]))
        
        return attributedText
    }
    
    //MARK: - Actions
    @IBAction func likeButtonDidTap(_ sender: UIButton) {
        delegate?.cell(self, wantsToLike: !sender.isSelected)
    }
    
    // pageControl을 터치하면 해당 위치로 collectionView(scrollView) 이동
    @IBAction func pageControlDidTap(_ sender: UIPageControl) {
        let page = sender.currentPage
        var frame = collectionView.frame
        frame.origin.x = frame.size.width * CGFloat(page)
        frame.origin.y = 0
        collectionView.scrollRectToVisible(frame, animated: true)
    }
}

//MARK: - UICollectionViewDelegate
extension FeedTableViewCell: UICollectionViewDelegate {
    // feed collectionView를 스크롤하면 pageControl도 알맞은 위치로 변경
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / self.frame.width)
        pageControl.currentPage = page
    }

}

//MARK: - UICollectionViewDataSource
extension FeedTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.feedImageName.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedImageCollectionViewCell.identifier, for: indexPath) as? FeedImageCollectionViewCell else { return UICollectionViewCell() }
        cell.setData(feedImage: (model?.feedImageName[indexPath.row])!)
        return cell
    }
}


//MARK: - UICollectionViewDelegateFlowLayout
extension FeedTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = width * (340/375)
        return CGSize(width: width, height: height)
    }
    
    // 콜렉션뷰 전체의 패딩값
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
    // Cell간의 좌우간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
