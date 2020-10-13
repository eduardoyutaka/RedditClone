//
//  RedditPostListItemView.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 13/10/2020.
//

import SwiftUI

struct RedditPostListItemView: View {
    var redditPost: RedditPostData
    
    var body: some View {
        VStack {
            HStack {
                Text(Helper.formatUsername(redditPost.author))
                Text("-")
                Text(Helper.formatDatetime(redditPost.created_utc))
                Spacer()
            }.font(.caption)
            HStack {
                Text(redditPost.title)
                    .font(.headline)
                Spacer()
            }
            if redditPost.thumbnail != "self" && redditPost.thumbnail != "default" {
                AsyncImage<Text>(
                    url: URL(string: redditPost.thumbnail)!,
                    placeholder: Text("Loading...")
                ).aspectRatio(contentMode: .fit)
            }
        }.padding(20)
    }
}



struct RedditPostListItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RedditPostListItemView(redditPost: RedditPostData.redditPosts[0])
        }
    }
}
