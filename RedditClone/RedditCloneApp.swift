//
//  RedditCloneApp.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 08/10/2020.
//

import SwiftUI

@main
struct RedditCloneApp: App {
    var body: some Scene {
        WindowGroup {
            RedditPostListView()
                .environmentObject(UserData())
        }
    }
}
