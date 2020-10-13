//
//  RedditPostListView.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 12/10/2020.
//

import SwiftUI

struct RedditPostListView: View {
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        NavigationView {
            content
                .navigationBarTitle("League of Legends")
                .onAppear(perform: loadData)
        }
    }
    
    private var content: some View {
        if userData.redditPosts.isEmpty {
            return AnyView(ProgressView())
        } else {
            return AnyView(
                List {
                    ForEach(userData.redditPosts) { redditPost in
                        RedditPostListItemView(redditPost: redditPost)
                        
                    }
                }
            )
        }
    }
    
    func loadData() {
        guard let url = URL(string: "https://www.reddit.com/r/leagueoflegends.json") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(RedditResponse.self, from: data) {
                    DispatchQueue.main.async {
                        userData.redditPosts = response.data.children.map { $0.data }
                    }
                }
             }
        }.resume()
    }
}

struct RedditPostListView_Previews: PreviewProvider {
    static var previews: some View {
        RedditPostListView()
            .environmentObject(UserData())
    }
}
