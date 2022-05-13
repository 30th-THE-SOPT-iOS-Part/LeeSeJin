//
//  NetworkHelper.swift
//  Instagram
//
//  Created by User on 2022/05/14.
//

import Foundation

struct NetworkHelper {
    private init() {}
    
    // 상태 코드와 데이터, decoding type을 가지고 통신의 결과를 핸들링하는 함수
    static func parseJSON<T: Codable> (by statusCode: Int, data: Data, type: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()

        guard let decodedData = try? decoder.decode(type.self, from: data) else { return .pathErr }
        
        switch statusCode {
        // 성공 시에는 넘겨받은 데이터를 decode(해독)하는 함수를 호출합니다.
        case 200..<300: return .success(decodedData)
        case 400..<500: return .requestErr(decodedData)
        case 500..<600: return .serverErr
        default: return .networkFail
        }
    }
}
