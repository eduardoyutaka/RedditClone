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
        ScrollView {
            LazyVStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(.white)
                        .shadow(radius: 5, x: 3, y: 3)
                    
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
                    }.padding()
                }.padding(.horizontal, 10)
            }
        }.background(Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)).edgesIgnoringSafeArea([.all]))
    }
}

struct RedditPostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RedditPostDetailView(redditPost: RedditPostData.data[0])
    }
}
