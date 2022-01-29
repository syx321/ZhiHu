//
//  AppConfigManager.swift
//  ZhiHu
//
//  Created by 苏易肖 on 2022/1/23.
//

import Foundation

enum AppConfigKey: String {
    case BaseURL = "https://news-at.zhihu.com/api/3"
    case lastStories = AppConfigKey.BaseURL.row + "/news/latest"
    
}

class AppConfigManager: BaseModelManager {
    
}
