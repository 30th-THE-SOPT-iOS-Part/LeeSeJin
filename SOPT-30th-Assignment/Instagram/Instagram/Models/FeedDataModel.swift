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
    var feedImageName: [String]
    var likeCount: Int
    let caption: String
    var commentCount: Int
}


extension FeedDataModel {
    static let sampleData: [FeedDataModel] = [
        FeedDataModel(profileImageName: "avatar1", profileName: "avatar1", feedImageName: [], likeCount: 30, caption: "π± κΈ°νλ μΌμ΄λλ κ²μ΄ μλλΌ λ§λ€μ΄ λ΄λ κ²μ΄λ€.", commentCount: 19),
        FeedDataModel(profileImageName: "avatar2", profileName: "avatar2", feedImageName: [], likeCount: 330, caption: "β° ν° λͺ©νλ₯Ό μ΄λ£¨κ³  μΆμΌλ©΄ νλ½μ κ΅¬νμ§ λ§λΌ.", commentCount: 24),
        FeedDataModel(profileImageName: "avatar3", profileName: "avatar3", feedImageName: [], likeCount: 130, caption: "π± κΈ°νλ μΌμ΄λλ κ²μ΄ μλλΌ λ§λ€μ΄ λ΄λ κ²μ΄λ€.", commentCount: 100),
        FeedDataModel(profileImageName: "avatar4", profileName: "avatar4", feedImageName: [], likeCount: 15, caption: "β° λλ¬κ°κ³ μΆλ€.aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbbb", commentCount: 7),
    
    ]
}

