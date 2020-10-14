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
                ScrollView {
                    LazyVStack {
                        ForEach(userData.redditPosts) { redditPost in
                            NavigationLink(destination: RedditPostDetailView(redditPost: redditPost)) {
                                RedditPostListItemView(redditPost: redditPost)
                            }
                            
                        }
                    }
                }.background(Color(#colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.937254902, alpha: 1)).edgesIgnoringSafeArea([.all]))
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

struct Card: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .shadow(radius: 5)
    }
}

struct RedditPostListView_Previews: PreviewProvider {
    static var previews: some View {
        RedditPostListView()
            .environmentObject(UserData())
    }
}
