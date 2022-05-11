//
//  signupResponse.swift
//  Instagram
//
//  Created by User on 2022/05/12.
//

import Foundation

struct SignUpResponse: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: SignUpData?
}

struct SignUpData: Codable {
    let id: Int
}
