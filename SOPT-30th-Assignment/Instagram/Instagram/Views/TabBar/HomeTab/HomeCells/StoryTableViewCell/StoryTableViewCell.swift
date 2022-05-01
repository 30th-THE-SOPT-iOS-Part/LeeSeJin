//
//  StoryTableViewCell.swift
//  Instagram
//
//  Created by User on 2022/05/01.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    static let identifier = "StoryTableViewCell"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Life cycle
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
        let nib = UINib(nibName: StoryCollectionViewCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
    }
    
}

//MARK: - UICollectionViewDelegate
extension StoryTableViewCell: UICollectionViewDelegate {

}

//MARK: - UICollectionViewDataSource
extension StoryTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StoryDataModel.sampleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setData(storyData: StoryDataModel.sampleData[indexPath.row])
        return cell
    }
    
    
}

//MARK: - UICollectionViewDelegateFlowLayout
extension StoryTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 58, height: 72)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 6, bottom: 8, right: 6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}
