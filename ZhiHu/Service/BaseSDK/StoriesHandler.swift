//
//  StoriesHandler.swift
//  ZhiHu
//
//  Created by 苏易肖 on 2022/1/24.
//

import Foundation

class StoriesHandler: BaseHandler {
    
    /**
     开始用的单例模式，但是现在想来可能并不合适，这个类只需要在StoriesManager里使用一次，不需要频繁的实例化或销毁，
     并不会在多个类里边调用多次，也不需要通过这个类共享信息。
    */
    //static let shared = StoriesHandler()
    
    let contentPath = "/stories"
    private var prev: Int = 0
    
    ///获取今天新闻
    func getNewStories(completionHandler: @escaping (Bool, String?, [Any]?, NSError?) -> Void) {
        self.requestDataArray(URLAddress.lastNews, contentPath: contentPath) {success, result, error in
            completionHandler(success, Date.getCurrentTime(timeFormat: .YYYYMMDD), result, error)
        }
    }
    
    ///获取之前新闻
    func getBeforeStories(completionHandler: @escaping (Bool, String?, [Any]?, NSError?) -> Void) {
        let prevDate = self.getPrevDate()
        self.requestDataArray(URLAddress.prevNews + prevDate, contentPath: contentPath) { success, result, error in
            completionHandler(true, prevDate, result, error)
        }
    }
    
    private func getPrevDate() -> String {
        prev -= 1
        return Date.getCurrentPastTime(day: prev, timeFormat: .YYYYMMDD)
    }
}
