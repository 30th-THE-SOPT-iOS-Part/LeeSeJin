//
//  HomeTabController.swift
//  Instagram
//
//  Created by User on 2022/04/14.
//

import UIKit

class HomeTabController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    private var feedDataList = FeedDataModel.sampleData
    
    //MARK: - Lifecycle
    override func viewDidLoad() {        
        super.viewDidLoad()
        hideNavigationBar(isHidden: true)
        
        setDelegate()
        configureTableView()
        getImages()
    }
    
    //MARK: - Helpers
    func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    func configureTableView() {
        let StoryNib = UINib(nibName: StoryTableViewCell.identifier, bundle: nil)
        tableView.register(StoryNib, forCellReuseIdentifier: StoryTableViewCell.identifier)
        
        let FeedNib = UINib(nibName: FeedTableViewCell.identifier, bundle: nil)
        tableView.register(FeedNib, forCellReuseIdentifier: FeedTableViewCell.identifier)
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
    }
    
}

//MARK: - UITableViewDelegate
extension HomeTabController: UITableViewDelegate {
}

//MARK: - UITableViewDataSource
extension HomeTabController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return FeedDataModel.sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StoryTableViewCell.identifier, for: indexPath) as? StoryTableViewCell else { return UITableViewCell() }

            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as? FeedTableViewCell else { return UITableViewCell()}
            
            cell.delegate = self
            cell.model = feedDataList[indexPath.row]
            cell.indexPath = indexPath.row
            cell.collectionView.reloadData()
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}


extension HomeTabController: FeedTableViewCellDelegate {
    func cell(_ cell: FeedTableViewCell, wantsToLike: Bool) {
        cell.likeButton.isSelected.toggle()
        if wantsToLike {
            cell.model?.likeCount += 1
            if let indexPath = cell.indexPath {
                feedDataList[indexPath].likeCount += 1
            }
        } else {
            cell.model?.likeCount -= 1
            if let indexPath = cell.indexPath {
                feedDataList[indexPath].likeCount -= 1
            }
        }
    }
}


//MARK: - API
extension HomeTabController {
    func getImages() {
        ImageService.shared.getImages { response in
            switch response {
            case .success(let data):
                guard let data = data as? [ImageData] else { return }
                for index in 0...self.feedDataList.count-1 {
                    for j in (index*3)...(index*3+2){
                        self.feedDataList[index].feedImageName.append(data[j].download_url)
                    }
                }
                self.tableView.reloadData()
            default:
                print("DEBUG: Fail to get images...")
                return
            }
        }
    }
}
