//
//  RedditCommentListViewModel.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 15/10/2020.
//

import Combine
import SwiftUI

class RedditCommentListViewModel: ObservableObject {
    @Published var redditComments = [RedditComment]()
    
    init(url: String) {
        guard let url = URL(string: url) else {
            print("Invalid URL")
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let response = try! JSONDecoder().decode([RedditResponse].self, from: data)
                DispatchQueue.main.async {
                    self.redditComments = response[1].data.children
                        .filter { $0.kind == "t1" }
                        .map { $0.data as! RedditComment }
                    
                }
             }
        }.resume()
    }
}
