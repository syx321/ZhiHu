//
//  Item.swift
//  ZhiHu
//
//  Created by 苏易肖 on 2022/1/22.
//

import Foundation

//Codable 可以直接用JSONDecoder()直接将JSON转化为model
struct StoryModel: Codable {
    let title: String?
    let url: String?
    let hint: String?
    let images: [String]?
    let id: Int?
    
    enum CodingKeys: String, CodingKey {
        case title
        case url
        case hint
        case images
        case id
    }
}
