//
//  HeroEntity.swift
//  Assignment4
//
//  Created by BMK on 17.03.2025.
//

import Foundation

struct HeroEntity: Decodable{
    let id: Int
    let name: String
    let powerstats:Powerstats
    let appearance: Appearance
    let biography: Biography
    let images: Image
    
    struct Powerstats: Decodable{
        let intelligence: Int
        let strength: Int
        let speed: Int
        let durability: Int
        let power: Int
        let combat: Int
    }
    
    struct Appearance: Decodable{
        let gender: String
        let race: String
        let eyeColor: String
        let hairColor: String
    }
    
    struct Biography: Decodable{
        let fullName: String
        let alterEgos: String
        let publisher: String
    }
    
    struct Image: Decodable{
        let md: String
    }
}

