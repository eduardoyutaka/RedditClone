//
//  RedditCommentCardView.swift
//  RedditClone
//
//  Created by Eduardo Yutaka Nakanishi on 14/10/2020.
//

import SwiftUI

struct RedditCommentCardView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.white)
                .shadow(radius: 5, x: 3, y: 3)
        }
    }
}

struct RedditCommentCardView_Previews: PreviewProvider {
    static var previews: some View {
        RedditCommentCardView()
    }
}
