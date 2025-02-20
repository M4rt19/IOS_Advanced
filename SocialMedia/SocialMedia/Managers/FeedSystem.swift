//
//  UserProfile.swift
//  SocialMedia
//
//  Created by BMK on 20.02.2025.
//

import Foundation

class FeedSystem {
    private var userCache: [UUID: UserProfile] = [:] // O(1) доступ
    private var feedPosts: [Post] = [] // Поддержка порядка
    private var hashtags: Set<String> = [] // Уникальные значения, быстрый поиск

    func addPost(_ post: Post) {
        feedPosts.insert(post, at: 0) // Вставляем в начало (эффективнее, чем `append()`)
    }

    func removePost(_ post: Post) {
        feedPosts.removeAll { $0.id == post.id }
    }
}
