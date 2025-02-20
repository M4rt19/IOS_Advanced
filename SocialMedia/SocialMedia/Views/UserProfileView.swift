//
//  UserProfile.swift
//  SocialMedia
//
//  Created by BMK on 20.02.2025.
//

import SwiftUI

struct UserProfileView: View {
    @State private var profile: UserProfile?
    private var profileManager = ProfileManager()

    var body: some View {
        VStack {
            if let profile = profile {
                Image(profile.profileImage) // Загрузка из Assets.xcassets
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .shadow(radius: 10)

                Text(profile.username)
                    .font(.title)
                Text(profile.bio)
                    .font(.subheadline)
                Text("Followers: \(profile.followers)")
            } else {
                ProgressView("Loading Profile...")
            }
        }
        .onAppear {
            profileManager.loadProfile(id: "some_id") { result in
                switch result {
                case .success(let loadedProfile):
                    self.profile = loadedProfile
                case .failure(let error):
                    print("Error loading profile: \(error.localizedDescription)")
                }
            }
        }
    }
}


