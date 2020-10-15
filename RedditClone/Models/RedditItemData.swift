//
//  RedditItemData.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 15/10/2020.
//

import Foundation

class RedditItemData: Codable, Identifiable, Hashable {
    let id: String
    let author: String
    let created_utc: Double
    let permalink: String
    
    static func == (lhs: RedditItemData, rhs: RedditItemData) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    init(id: String, author: String, created_utc: Double, permalink: String) {
        self.id = id
        self.author = author
        self.created_utc = created_utc
        self.permalink = permalink
    }
}
