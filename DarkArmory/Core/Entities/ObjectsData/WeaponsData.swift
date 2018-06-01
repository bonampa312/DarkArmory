//
//  ObjectsData.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/17/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

struct WeaponShort: Codable {
    let id: String
    let name: String
    let weight: Float
    let imageURL: String
    let baseDamage: AttackKind
    let requirements: Requirements
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "name"
        case weight = "weight"
        case imageURL = "image_url"
        case baseDamage = "base_damage"
        case requirements = "requirements"
    }
}

struct WeaponDetail: Codable {
    let id: String
    let name: String
    let weaponType: String
    let weight: Float
    let description: String
    let imageURL: String
    let locations: [String]
    let stability: Int
    let attackType: String
    let critical: Int
    let range: Int?
    let skill: Skill?
    let baseDamage: AttackKind
    let aditionalDamage: AditionalDamage?
    let requirements: Requirements
    let bonuses: Bonuses
    let defenses: AttackKind
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "name"
        case weaponType = "weapon_type"
        case weight = "weight"
        case description = "description"
        case imageURL = "image_url"
        case locations = "locations"
        case stability = "stability"
        case attackType = "attack_type"
        case critical = "critical"
        case range = "range"
        case skill = "skill"
        case baseDamage = "base_damage"
        case aditionalDamage = "aditional_damage"
        case requirements = "requirements"
        case bonuses = "bonuses"
        case defenses = "defenses"
    }
}

struct AditionalDamage: Codable {
    let bleed: Int
    let poison: Int
    let frost: Int
    
    enum CodingKeys: String, CodingKey {
        case bleed = "bleed"
        case poison = "poison"
        case frost = "frost"
    }
}

struct Skill: Codable {
    let name: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
    }
}
