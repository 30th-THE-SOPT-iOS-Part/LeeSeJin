//
//  HomeTabController.swift
//  Instagram
//
//  Created by User on 2022/04/14.
//

import UIKit

class HomeTabController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {        
        super.viewDidLoad()
        hideNavigationBar(isHidden: true)
        
        setDelegate()
        configureTableView()
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
        
    }
    
    //MARK: - Actions
}

extension HomeTabController: UITableViewDelegate {
    
}

extension HomeTabController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: StoryTableViewCell.identifier, for: indexPath) as? StoryTableViewCell else { return UITableViewCell() }

            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as? FeedTableViewCell else { return UITableViewCell()}
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}
