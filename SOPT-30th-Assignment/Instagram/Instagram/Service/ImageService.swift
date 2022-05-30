//
//  ImageService.swift
//  Instagram
//
//  Created by User on 2022/05/14.
//

import Foundation
import Alamofire


struct ImageService {
    static let shared = ImageService()
    
    private init() {}
    
    // 이미지 리스트 가져오기
    func getImages(completion: @escaping(NetworkResult<Any>) -> Void) {
        let url = APIConstants.imageBaseURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let parameter: Parameters = ["page": 1, "limit": 12]
        
        let dataRequest = AF.request(url, method: .get, parameters: parameter, encoding: URLEncoding.default, headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = NetworkHelper.parseJSON(by: statusCode, data: value, type: [ImageData].self)
                completion(networkResult)
                
            case .failure:
                completion(.networkFail)
            }
        }
    }

}
