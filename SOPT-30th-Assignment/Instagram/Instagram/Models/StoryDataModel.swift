//
//  StoryDataModel.swift
//  Instagram
//
//  Created by User on 2022/05/01.
//

import Foundation

struct StoryDataModel {
    let profileImageName: String
    let profileName: String
}

extension StoryDataModel {
    static let sampleData: [StoryDataModel] = [
        StoryDataModel(profileImageName: "avatar1", profileName: "avatar1"),
        StoryDataModel(profileImageName: "avatar2", profileName: "avatar2"),
        StoryDataModel(profileImageName: "avatar3", profileName: "avatar3"),
        StoryDataModel(profileImageName: "avatar4", profileName: "avatar4"),
        StoryDataModel(profileImageName: "avatar5", profileName: "avatar5"),
        StoryDataModel(profileImageName: "avatar6", profileName: "avatar6")
    ]
}
