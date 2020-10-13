//
//  RedditResponse.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 12/10/2020.
//

import Foundation

struct RedditResponse: Codable {
    let kind: String
    let data: RedditListing
}
