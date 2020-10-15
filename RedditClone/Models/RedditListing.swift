//
//  RedditListing.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 12/10/2020.
//

import Foundation

struct RedditListing: Codable {
    let modhash: String
    let dist: Int
    let children: [RedditItem]
    let after: String
    let before: String?
}
