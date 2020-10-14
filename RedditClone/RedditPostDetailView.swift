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
        List {
            VStack {
                HStack {
                    Text(Helper.formatUsername(redditPost.author))
                    Spacer()
                    Text(Helper.formatDatetime(redditPost.created_utc))
                }.font(.caption).padding(.bottom)
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
}

struct RedditPostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RedditPostDetailView(redditPost: RedditPostData.data[0])
    }
}
