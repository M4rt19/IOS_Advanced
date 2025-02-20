//
//  UserProfile.swift
//  SocialMedia
//
//  Created by BMK on 20.02.2025.
//

import Foundation

class ProfileManager {
    private var activeProfiles: [String: UserProfile] = [
        "some_id": UserProfile(
            id: UUID(),
            username: "Levi",
            bio: "iOS Annihillator",
            followers: 120,
            profileImage: "profile_image" 
        )
    ]
    
    weak var delegate: ProfileUpdateDelegate?
    var onProfileUpdate: ((UserProfile) -> Void)?

    init(delegate: ProfileUpdateDelegate? = nil) {
        self.delegate = delegate
    }

    func loadProfile(id: String, completion: @escaping (Result<UserProfile, Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self = self else { return }

            if let profile = self.activeProfiles[id] {
                DispatchQueue.main.async {
                    completion(.success(profile))
                }
            } else {
                let error = NSError(domain: "ProfileError", code: 404, userInfo: [NSLocalizedDescriptionKey: "Profile not found"])
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
