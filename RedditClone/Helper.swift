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
    
    static func formatElapsedTimeInHours(_ elapsedTimeInHours: Int) -> String {
        if elapsedTimeInHours < 24 {
            return String(elapsedTimeInHours) + "h"
        } else {
            let elapsedTimeInDays = elapsedTimeInHours / 24
            return String(elapsedTimeInDays) + "d"
        }
    }
    
    static func elapsedTimeInHours(since unixTime: Double) -> Int {
        let today = Date(timeIntervalSinceNow: 0)
        let createdAt = Date(timeIntervalSinceNow: unixTime)
        let result = Int((today.timeIntervalSinceReferenceDate - createdAt.timeIntervalSinceReferenceDate) / 3600)
        return result
    }
}
