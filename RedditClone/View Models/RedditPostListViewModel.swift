//
//  RedditPostListViewModel.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 15/10/2020.
//

import Combine
import SwiftUI

class RedditPostListViewModel: ObservableObject {
    @Published var redditPosts = [RedditPost]()
    var after: String?
    
    init() {
        guard let url = URL(string: "https://www.reddit.com/r/leagueoflegends.json") else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let response = try? JSONDecoder().decode(RedditResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.after = response.data.after
                        self.redditPosts = response.data.children.map { $0.data as! RedditPost }
                    }
                }
             }
        }.resume()
    }
    
    func loadMore(after redditPost: RedditPost) {
        if redditPost == redditPosts.last {
            guard let url = URL(string: "https://www.reddit.com/r/leagueoflegends.json?after=\(after ?? "")") else {
                print("Invalid URL")
                return
            }
            let request = URLRequest(url: url)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    if let response = try? JSONDecoder().decode(RedditResponse.self, from: data) {
                        if self.after != response.data.after {
                            DispatchQueue.main.async {
                                self.after = response.data.after
                                self.redditPosts.append(contentsOf: response.data.children.map { $0.data as! RedditPost })
                            }
                        }
                    }
                 }
            }.resume()
        }
    }
}
