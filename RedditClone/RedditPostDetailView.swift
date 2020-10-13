//
//  RedditPostDetailView.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 13/10/2020.
//

import SwiftUI

struct RedditPostDetailView: View {
    var redditPost: RedditPostData
    
    var body: some View {
        VStack {
            HStack {
                Text(Helper.formatUsername(redditPost.author))
                Text("-")
                Text(Helper.formatDatetime(redditPost.created_utc))
                Spacer()
                Text("\n")
            }.font(.caption)
            HStack {
                Text(redditPost.title).font(.headline)
                Spacer()
            }
            HStack {
                Text(redditPost.selftext).font(.body)
                Spacer()
            }
            Spacer()
        }.padding(20)
    }
}

struct RedditPostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RedditPostDetailView(redditPost: RedditPostData.redditPosts[0])
    }
}
