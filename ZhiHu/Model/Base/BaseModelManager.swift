//
//  BaseModelManager.swift
//  ZhiHu
//
//  Created by 苏易肖 on 2022/1/22.
//

import Foundation
import SwiftyJSON

class BaseModelManager: NSObject {
    
    func parseModelArray<T: Codable>(array: [Any]?, complicationCallBack: @escaping (Bool, [T]?) -> Void) {
        do {
            if let array = array {
                var result: [T]? = []
                for item in array {
                    let t = try JSONDecoder().decode(T.self, from: JSON(item).rawData())
                    result?.append(t)
                }
                complicationCallBack(true, result)
            } else {
                complicationCallBack(false, nil)
            }
        } catch {
            complicationCallBack(false, nil)
        }
    }
    
}
