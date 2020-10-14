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
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.white)
                .shadow(radius: 5)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(Helper.formatUsername(redditPost.author))
                        .font(.caption)
                    Spacer()
                    Text(Helper.formatDatetime(redditPost.created_utc))
                        .font(.caption)
                }.padding(.bottom)
                
                Text(redditPost.title)
                    .font(.headline)
                
                if redditPost.thumbnail != "self" && redditPost.thumbnail != "default" {
                    AsyncImage<Text>(
                        url: URL(string: redditPost.thumbnail)!,
                        placeholder: Text("Loading...")
                    ).aspectRatio(contentMode: .fit)
                }
            }.padding()
        }
        .foregroundColor(.black)
        .padding(.horizontal, 5)
    }
}



struct RedditPostListItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RedditPostListItemView(redditPost: RedditPostData.data[0])
        }
    }
}
