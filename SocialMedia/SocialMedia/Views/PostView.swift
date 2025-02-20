//
//  UserProfile.swift
//  SocialMedia
//
//  Created by BMK on 20.02.2025.
//

import SwiftUI

struct PostView: View {
    var post: Post

    var body: some View {
        VStack(alignment: .leading) {
            Text(post.content)
                .font(.body)
            Text("❤️ \(post.likes) likes")
                .font(.footnote)
        }
        .padding()
    }
}
