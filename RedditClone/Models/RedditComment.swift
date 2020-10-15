//
//  ReddirComment.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 15/10/2020.
//

import Foundation

class RedditComment: RedditItemData {
    let body: String
    let replies: [RedditListing]?
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
    }
}
