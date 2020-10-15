//
//  RedditCommentListView.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 15/10/2020.
//

import SwiftUI
import Combine

struct RedditCommentListView: View {
    @ObservedObject var vm = RedditCommentListViewModel(url: "https://www.reddit.com/r/leagueoflegends/comments/j32mzn/worlds_pickems_megathread.json")
    
    var body: some View {
        if vm.redditComments.isEmpty {
            ProgressView()
        } else {
            ForEach(vm.redditComments) { redditComment in
                RedditCommentListItemView(redditComment: redditComment)
            }
        }
    }
}

struct RedditCommentListView_Previews: PreviewProvider {
    static var previews: some View {
        RedditCommentListView()
    }
}
