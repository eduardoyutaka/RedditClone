//
//  RedditMoreChildren.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 15/10/2020.
//

import Foundation

class RedditMoreChildren: RedditItemData {
    let children: [String]
    
    static func nullObject() -> RedditMoreChildren {
        return RedditMoreChildren(id: "", author: "", created_utc: Date().timeIntervalSince1970, permalink: "", children: [])
    }
    
    enum CodingKeys: CodingKey {
        case children
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        children = try container.decode([String].self, forKey: .children)
        try super.init(from: decoder)
    }
    
    init(id: String, author: String, created_utc: Double, permalink: String, children: [String]) {
        self.children = children
        super.init(id: id, author: author, created_utc: created_utc, permalink: permalink)
    }
}
