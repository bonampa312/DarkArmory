//
//  RingsData.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/25/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

public struct RingShort: Codable {
    public let id: String
    public let name: String
    public let imageURL: String
    public let weight: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "name"
        case imageURL = "image_url"
        case weight = "weight"
    }
}

public struct RingDetail: Codable {
    public let id: String
    public let name: String
    public let imageURL: String
    public let locations: [String]
    public let weight: Int
    public let description: String
    public let effects: [String]
    
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
