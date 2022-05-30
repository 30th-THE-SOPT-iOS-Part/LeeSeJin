//
//  APIConstants.swift
//  Instagram
//
//  Created by User on 2022/05/12.
//

import Foundation


struct APIConstants {
    //MARK: - Base URL
    static let authBaseURL = "http://13.124.62.236"
    static let imageBaseURL = "https://picsum.photos/v2/list"
    
    //MARK: - Fearture URL
    static let loginURL = authBaseURL + "/auth/signin"
    static let signUpURL = authBaseURL + "/auth/signup"
        
}
