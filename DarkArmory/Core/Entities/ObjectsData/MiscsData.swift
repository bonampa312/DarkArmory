//
//  MiscsData.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/29/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation
import Alamofire

struct MiscShort: Codable {
    let id: String
    let name: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "name"
        case imageURL = "image_url"
    }
}

struct MiscDetail: Codable {
    let name: String
    let imageURL: String
    let locations: [String]
    let description: String
    let effects: [String]
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case imageURL = "image_url"
        case locations = "locations"
        case description = "description"
        case effects = "effects"
        case id = "_id"
    }
}
