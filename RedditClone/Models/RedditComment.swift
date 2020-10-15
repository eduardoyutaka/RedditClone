//
//  ReddirComment.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 15/10/2020.
//

import Foundation

class RedditComment: RedditItemData {
    let body: String
    let replies: [RedditComment]
    
    enum CodingKeys: CodingKey {
        case body, replies
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        body = try container.decode(String.self, forKey: .body)
        if let response = try? container.decode(RedditResponse.self, forKey: .replies) {
            self.replies = response.data.children.map { $0.data as! RedditComment }
        } else {
            self.replies = []
        }
        try super.init(from: decoder)
    }
    
    init(id: String, author: String, created_utc: Double, permalink: String, body: String, replies: [RedditComment]) {
        self.body = body
        self.replies = replies
        super.init(id: id, author: author, created_utc: created_utc, permalink: permalink)
    }
}
