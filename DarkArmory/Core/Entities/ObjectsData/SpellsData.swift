//
//  SpellsData.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/30/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

struct SpellsShort: Codable {
    let id: String
    let name: String
    let spellType: SpellType
    let imageURL: String
    let slots: Int
    let uses: Int?
    let requeriments: Requeriments
    let focusPoints: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "name"
        case spellType = "spell_type"
        case imageURL = "image_url"
        case slots = "slots"
        case uses = "uses"
        case requeriments = "requeriments"
        case focusPoints = "focus_points"
    }
}

struct SpellsDetail: Codable {
    let id: String
    let name: String
    let spellType: SpellType
    let description: String
    let locations: [String]
    let imageURL: String
    let slots: Int
    let uses: Int?
    let requeriments: Requeriments
    let game: String
    let focusPoints: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "name"
        case spellType = "spell_type"
        case description = "description"
        case locations = "locations"
        case imageURL = "image_url"
        case slots = "slots"
        case uses = "uses"
        case requeriments = "requeriments"
        case game = "game"
        case focusPoints = "focus_points"
    }
}

struct SpellType: Codable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
}
