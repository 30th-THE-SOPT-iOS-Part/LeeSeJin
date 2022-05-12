//
//  UserService.swift
//  Instagram
//
//  Created by User on 2022/05/12.
//

import Foundation
import Alamofire

struct UserService {
    static let shared = UserService()
    
    private init() {}
    
    // 로그인
    func login(name: String, email: String, password: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = APIConstants.loginURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let body: Parameters = [
            "name": name,
            "email": email,
            "password": password
        ]
        
        // Request 생성
        let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        
        // Request 시작
        dataRequest.responseData { response in
            switch response.result {
            // 성공 시 상태코드와 데이터(value) 수신
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                
                let networkResult = self.parseJSON(by: statusCode, data: value, type: LoginResponse.self)
                completion(networkResult)
            
            // 실패 시 networkFail(통신 실패)신호 전달
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    // 회원가입
    func signUp(name: String, email: String, password: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        let url = APIConstants.signUpURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let body: Parameters = [
            "name": name,
            "email": email,
            "password": password
        ]
        
        // Request 생성
        let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        
        // Request 시작
        dataRequest.responseData { response in
            switch response.result {
            // 성공 시 상태코드와 데이터(value) 수신
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                
                let networkResult = self.parseJSON(by: statusCode, data: value, type: SignUpResponse.self)
                completion(networkResult)
                
            // 실패 시 networkFail(통신 실패)신호 전달
            case .failure:
                completion(.networkFail)
            }
        }
        
    }
    
    
    // 상태 코드와 데이터, decoding type을 가지고 통신의 결과를 핸들링하는 함수
    private func parseJSON<T: Codable> (by statusCode: Int, data: Data, type: T.Type) -> NetworkResult<Any> {
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




