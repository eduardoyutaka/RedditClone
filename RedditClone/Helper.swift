//
//  Helper.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 13/10/2020.
//

import Foundation

struct Helper {
    static func formatUsername(_ username: String) -> String {
        return "u/\(username)"
    }
    
    static func formatDatetime(_ datetime: Double) -> String {
        let today = Date(timeIntervalSinceNow: 0)
        let createdAt = Date(timeIntervalSince1970: datetime)
        return String(Int((today.timeIntervalSinceReferenceDate - createdAt.timeIntervalSinceReferenceDate) / 3600)) + "h"
    }
}
