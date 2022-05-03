//
//  FeedDataModel.swift
//  Instagram
//
//  Created by User on 2022/05/01.
//

import Foundation

struct FeedDataModel {
    let profileImageName: String
    let profileName: String
    let feedImageName: String
    var likeCount: Int
    let caption: String
    var commentCount: Int
}


extension FeedDataModel {
    static let sampleData: [FeedDataModel] = [
        FeedDataModel(profileImageName: "avatar1", profileName: "avatar1", feedImageName: "postImage1", likeCount: 30, caption: "🌱 기회는 일어나는 것이 아니라 만들어 내는 것이다.", commentCount: 19),
        FeedDataModel(profileImageName: "avatar2", profileName: "avatar2", feedImageName: "postImage2", likeCount: 330, caption: "⏰ 큰 목표를 이루고 싶으면 허락을 구하지 마라.", commentCount: 24),
        FeedDataModel(profileImageName: "avatar3", profileName: "avatar3", feedImageName: "postImage3", likeCount: 130, caption: "🌱 기회는 일어나는 것이 아니라 만들어 내는 것이다.", commentCount: 100),
        FeedDataModel(profileImageName: "avatar4", profileName: "avatar4", feedImageName: "postImage4", likeCount: 15, caption: "⏰ 놀러가고싶다.aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbb", commentCount: 7),
    
    ]
}

