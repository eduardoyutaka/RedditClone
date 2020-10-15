//
//  RedditItem.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 12/10/2020.
//

import Foundation

struct RedditItem: Codable {
    let kind: String
    let data: RedditItemData
    
    enum CodingKeys: CodingKey {
        case kind, data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        kind = try container.decode(String.self, forKey: .kind)
        switch kind {
        case "t1":
            data = try container.decode(RedditComment.self, forKey: .data)
        case "t3":
            data = try container.decode(RedditPost.self, forKey: .data)
        default:
            fatalError("Type has not been implemented")
        }
    }
}
