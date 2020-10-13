//
//  RedditPostData.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 12/10/2020.
//

import Foundation

struct RedditPostData: Hashable, Codable, Identifiable {
    let author: String
    let created_utc: Double
    let id: String
    let selftext: String
    let title: String
    let thumbnail: String
}
