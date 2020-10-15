//
//  RedditPost.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 12/10/2020.
//

import Foundation

class RedditPost: RedditItemData {
    let name: String
    let selftext: String
    let title: String
    let thumbnail: String
    
    enum CodingKeys: CodingKey {
        case selftext, title, thumbnail, name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        selftext = try container.decode(String.self, forKey: .selftext)
        title = try container.decode(String.self, forKey: .title)
        thumbnail = try container.decode(String.self, forKey: .thumbnail)
        try super.init(from: decoder)
    }
    
    init(author: String, created_utc: Double, id: String, permalink: String, name: String, selftext: String, title: String, thumbnail: String) {
        self.name = name
        self.selftext = selftext
        self.title = title
        self.thumbnail = thumbnail
        super.init(id: id, author: author, created_utc: created_utc, permalink: permalink)
    }
}
