//
//  RingsData.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/25/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

struct RingShort: Codable {
    let id: String
    let name: String
    let imageURL: String
    let weight: Float
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "name"
        case imageURL = "image_url"
        case weight = "weight"
    }
}

struct RingDetail: Codable {
    let id: String
    let name: String
    let imageURL: String
    let locations: [String]
    let weight: Float
    let description: String
    let effects: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "name"
        case imageURL = "image_url"
        case locations = "locations"
        case weight = "weight"
        case description = "description"
        case effects = "effects"
    }
}
