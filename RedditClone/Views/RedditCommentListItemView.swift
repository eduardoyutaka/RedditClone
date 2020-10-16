//
//  RedditCommentListItemView.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 14/10/2020.
//

import SwiftUI

struct RedditCommentListItemView: View {
    var redditComment: RedditComment
    var replyPadding: CGFloat = 0.0
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.white)
                .shadow(radius: 5, x: 3, y: 3)
            
            VStack {
                HStack {
                    Text(Helper.formatUsername(redditComment.author))
                        .font(.caption)
                    Spacer()
                    Text(
                        Helper.formatElapsedTimeInHours(
                            Helper.elapsedTimeInHours(since: redditComment.created_utc)
                        )
                    )
                        .font(.caption)
                }.padding(.bottom)
                HStack {
                    Text(redditComment.body)
                        .font(.body)
                    Spacer()
                }
            }
            .padding()
        }
        .padding(.horizontal, 10)
        .padding(.leading, replyPadding)
        
        ForEach(redditComment.replies) { reply in
            RedditCommentListItemView(redditComment: reply, replyPadding: replyPadding + 10.0)
        }
    }
}

struct RedditCommentListItemView_Previews: PreviewProvider {
    static var previews: some View {
        RedditCommentListItemView(redditComment: RedditComment.data[0])
    }
}
