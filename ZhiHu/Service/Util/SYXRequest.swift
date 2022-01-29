//
//  SYXRequest.swift
//  ZhiHu
//
//  Created by 苏易肖 on 2022/1/23.
//

import Foundation
import Alamofire

enum ResultStatus: Int {
    case success = 0 //Success
    case exceptionFail = -1 //Exception for parsing data
    case connectFail = -2 //Fail to connect server
    case requestFail = -3
    case responseFail = -4
    case responseMissingFail = -5 //Fail to get response data
    case responseParseFail = -6
    case authroziedFail = -7
}

class SYXRequest {
    static let shared = SYXRequest()
    
    func requestCache() {
        
    }
    
    func  requestJSON(_ convertible: URLConvertible,
                     method: HTTPMethod = .get,
                     parameters: Parameters? = nil,
                     encoding: ParameterEncoding = JSONEncoding.default,
                     headers: HTTPHeaders? = nil,
                     interceptor: RequestInterceptor? = nil,
                     timeoutInterval: TimeInterval = 15,
                     completionHandler: @escaping (AFDataResponse<Any>) -> Void) {
        //TODO: 健壮性考虑
                
        AF.request(convertible, method: method, parameters: parameters, encoding: encoding, headers: headers, interceptor: interceptor, requestModifier: {$0.timeoutInterval = timeoutInterval}).validate().responseJSON { response in
            //TODO: 持久化
            if response.response?.statusCode == 200 {
                if let responseData = response.data {
                    let _ = responseData
                }
            }
            ///返回结果
            completionHandler(response)
        }
    }
    
}
