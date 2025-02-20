//
//  UserProfile.swift
//  SocialMedia
//
//  Created by BMK on 20.02.2025.
//

import SwiftUI

struct FeedView: View {
    @State private var posts: [Post] = [
        Post(id: UUID(), authorId: UUID(), content: "Hello, world!", likes: 120),
        Post(id: UUID(), authorId: UUID(), content: "SwiftUI is awesome!", likes: 98)
    ]

    var body: some View {
        NavigationView {
            List(posts, id: \.id) { post in
                PostView(post: post)
            }
            .navigationTitle("Feed")
        }
    }
}

// Не забудь добавить этот код для предварительного просмотра
struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

