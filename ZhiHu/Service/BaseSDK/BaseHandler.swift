//
//  BaseHandler.swift
//  ZhiHu
//
//  Created by 苏易肖 on 2022/1/23.
//

import Foundation
import Alamofire
import SwiftyJSON

enum URLAddress {
    public static let base      =   "https://news-at.zhihu.com/api/3"
    public static let lastNews  =   base + "/news/latest"
    public static let prevNews  =   base + "/stories/before/"//+date
    public static let news      =   base + "/news/"//+id
    public static let extraInfo =   base + "/story-extra/"//+id
}


///其他handler的基类，实现基本的JSON请求功能，其他子类调用基本请求实现具体需求的请求
class BaseHandler {
    
    //根据contentPath对应JSON的key
    private func parseModelArray(data: Data, contentPath: String? = "/", completionHandler: @escaping (Int?, [Any]?) -> Void) {
        do {
            let jsonDict = try JSON(data: data)
            if contentPath == "/" {
                completionHandler(nil, jsonDict.array)
            } else {
                let pathComponents = contentPath!.components(separatedBy: "/")
                var dict = jsonDict
                for component in pathComponents {
                    if component != "" {
                        dict = dict[component]
                    }
                }
                completionHandler(ResultStatus.success.rawValue, dict.array)
            }
        } catch {
            completionHandler(ResultStatus.exceptionFail.rawValue, nil)
        }
    }
    
    private func PareDictData() {
        
    }
    
    func requestDataArray(_ convertible: URLConvertible,
                          contentPath: String? = "/",
                          method: HTTPMethod = .get,
                          parameters: Parameters? = nil,
                          encoding: ParameterEncoding = JSONEncoding.default,
                          headers: HTTPHeaders? = nil,
                          interceptor: RequestInterceptor? = nil,
                          timeoutInterval: TimeInterval = 15,
                          completionHandler: @escaping (Bool, [Any]?, NSError?) -> Void) {
        SYXRequest.shared.requestJSON(convertible, method: method, parameters: parameters, encoding: encoding, headers: headers, interceptor: interceptor, timeoutInterval: timeoutInterval) { response in
            switch response.result {
            case .success:
                switch response.response?.statusCode {
                case 200:
                    if let responseData = response.data {
                        self.parseModelArray(data: responseData, contentPath: contentPath) {status, result in
                            if let result = result {
                                completionHandler(true, result, nil)
                            } else {
                                if status != nil {
                                    completionHandler(false, nil, NSError(domain: String(describing: self), code: ResultStatus.responseMissingFail.rawValue))
                                } else {
                                    completionHandler(false, nil, NSError(domain: String(describing: self), code: ResultStatus.responseMissingFail.rawValue))
                                }
                                
                            }
                            
                        }
                    }
                default:
                    //TODO: 健壮性
                    break
                }
            default:
                break
            }
        }
    }
    
    func requestDataDict(_ convertible: URLConvertible,
                         method: HTTPMethod = .get,
                         parameters: Parameters? = nil,
                         encoding: ParameterEncoding = JSONEncoding.default,
                         headers: HTTPHeaders? = nil,
                         interceptor: RequestInterceptor? = nil,
                         timeoutInterval: TimeInterval = 15,
                         completionHandler: @escaping (Bool, Dictionary<String,Any>?, NSError) -> Void) {
        
    }
}
