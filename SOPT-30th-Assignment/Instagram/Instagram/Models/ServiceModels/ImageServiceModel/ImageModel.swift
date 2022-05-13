//
//  ImageModel.swift
//  Instagram
//
//  Created by User on 2022/05/14.
//

import Foundation

//struct ImageResponse: Codable {
//    var images: ImageData
//    
//    init(from decoder: Decoder) throws {
//        var container = try decoder.unkeyedContainer()
//        images = try container.decode(ImageData.self)
//    }
//}


struct ImageData: Codable {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: String
    let download_url: String
}
