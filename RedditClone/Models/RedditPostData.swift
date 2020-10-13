//
//  RedditPostData.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 12/10/2020.
//

import Foundation

struct RedditPostData: Codable {
    let author: String
    let selftext: String
    let title: String
    let thumbnail: String
    let created_utc: Int
}
