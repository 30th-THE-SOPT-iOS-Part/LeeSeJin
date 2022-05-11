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
                
                let networkResult = self.judgeStatus(by: statusCode, isLogin: true, value)
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
                
                let networkResult = self.judgeStatus(by: statusCode, isLogin: false, value)
                completion(networkResult)
                
            // 실패 시 networkFail(통신 실패)신호 전달
            case .failure:
                completion(.networkFail)
            }
        }
        
    }
    
    
    // 상태 코드와 값(value, data)를 가지고 통신의 결과를 핸들링하는 함수입니다.
    private func judgeStatus(by statusCode: Int, isLogin: Bool, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        // 성공 시에는 넘겨받은 데이터를 decode(해독)하는 함수를 호출합니다.
        case 200: return decodeValidData(data: data, isLogin: isLogin)
        case 201: return decodeValidData(data: data, isLogin: isLogin)
        case 404: return .pathErr("이메일에 해당하는 사용자 정보가 없습니다.")
        case 409: return isLogin ? .pathErr("비밀 번호가 올바르지 않습니다.") : .pathErr("유저 정보 중복")
        case 500..<600: return .serverErr
        default: return .networkFail
        }
    }
    
    private func decodeValidData(data: Data, isLogin: Bool) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        if isLogin {
            guard let decodedData = try? decoder.decode(LoginResponse.self, from: data) else { return .pathErr("Can not decode") }
            return .success(decodedData as Any)
        } else {
            guard let decodedData = try? decoder.decode(SignUpResponse.self, from: data) else { return .pathErr("Can not decode") }
            return .success(decodedData as Any)
        }
    }
}




