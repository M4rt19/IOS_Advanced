//
//  HeroService.swift
//  Assignment4
//
//  Created by BMK on 17.03.2025.
//

import Foundation


protocol HeroService {
    func fetchHeroes() async throws -> [HeroEntity]
    
}

struct HeroServiceImpl: HeroService {
    func fetchHeroes() async throws -> [HeroEntity] {
        let urlString = URLString.urlString
        guard let url = URL(string: urlString.rawValue) else {
            throw HeroErrors.WrongUrl
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            let heroes = try JSONDecoder().decode([HeroEntity].self, from: data)
            return heroes
        }
        catch {
            throw HeroErrors.Error
        }
        
    }
}

enum HeroErrors: Error {
    case WrongUrl
    case Error
}

enum URLString: String {
    case urlString = "https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json"
}
