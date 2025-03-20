//
//  HeroListModel.swift
//  Assignment4
//
//  Created by BMK on 17.03.2025.
//

import Foundation

struct HeroListModel{
    let id: Int
    let images: HeroImage
    let name: String
    var imageUrl: URL?{
        URL(string: images.md)
    }
    
    struct HeroImage: Decodable{
        let md: String
    }
}
