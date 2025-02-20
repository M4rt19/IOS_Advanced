//
//  UserProfile.swift
//  SocialMedia
//
//  Created by BMK on 20.02.2025.
//

import Foundation

struct UserProfile: Hashable {
    let id: UUID
    let username: String
    var bio: String
    var followers: Int
    var profileImage: String // Новое поле для хранения имени изображения

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    static func == (lhs: UserProfile, rhs: UserProfile) -> Bool {
        return lhs.id == rhs.id
    }
}
