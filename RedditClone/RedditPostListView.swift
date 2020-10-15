//
//  RedditPostListView.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 12/10/2020.
//

import SwiftUI

struct RedditPostListView: View {
    @ObservedObject var vm = RedditPostListViewModel()
    
    var body: some View {
        NavigationView {
            if vm.redditPosts.isEmpty {
                ProgressView()
            } else {
                ScrollView {
                    LazyVStack {
                        ForEach(vm.redditPosts) { redditPost in
                            NavigationLink(destination: RedditPostDetailView(redditPost: redditPost)) {
                                RedditPostListItemView(redditPost: redditPost)
                            }
                            
                        }
                    }
                }
                .background(Color(#colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.968627451, alpha: 1)).edgesIgnoringSafeArea([.all]))
                .navigationBarTitle("League of Legends")
            }
        }
    }
}

struct RedditPostListView_Previews: PreviewProvider {
    static var previews: some View {
        RedditPostListView()
    }
}
