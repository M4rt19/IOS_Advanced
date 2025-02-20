//
//  UserProfile.swift
//  SocialMedia
//
//  Created by BMK on 20.02.2025.
//

import Foundation

struct Post: Hashable {
    let id: UUID
    let authorId: UUID
    var content: String
    var likes: Int

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: Post, rhs: Post) -> Bool {
        return lhs.id == rhs.id
    }
}
