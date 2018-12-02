//
//  Albums.swift
//  JSONToCoreDataAgain
//
//  Created by anoop on 2018-11-27.
//  Copyright © 2018 anoop. All rights reserved.
//

import Foundation


struct Album: Codable {
        
    let title: String?
    let artist: String?
    let url: String?
    let image: String?
    let thumbnail_image: String?
    
    // Define the coding keys
    enum CodingKeys: String, CodingKey {
        
        case title           = "title"
        case artist          = "artist"
        case url             = "url"
        case image           = "image"
        case thumbnail_image = "thumbnail_image"
        
    }
    
    // Initialize all values
    init(from decoder:Decoder) throws{
            // Get the container
            let container = try decoder.container(keyedBy: CodingKeys.self)
            // Get the values
            title = try container.decodeIfPresent(String.self, forKey: .title)
            artist = try container.decodeIfPresent(String.self, forKey: .artist)
            url = try container.decodeIfPresent(String.self, forKey: .url)
            image = try container.decodeIfPresent(String.self, forKey: .image)
            thumbnail_image = try container.decodeIfPresent(String.self, forKey: .thumbnail_image)
    }
}
