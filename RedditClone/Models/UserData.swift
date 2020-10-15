//
//  Data.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 13/10/2020.
//

import Foundation
import Combine

final class UserData: ObservableObject {
    @Published var redditPosts: [RedditPost] = []
}
