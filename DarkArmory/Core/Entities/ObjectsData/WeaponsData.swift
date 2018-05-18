//
//  ObjectsData.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/17/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

public struct WeaponList: Codable {
    public let id: String
    public let name: String
    public let weight: Double
    public let imageURL: String
    public let baseDamage: AttackKind
    public let requeriments: Requeriments
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "name"
        case weight = "weight"
        case imageURL = "image_url"
        case baseDamage = "base_damage"
        case requeriments = "requeriments"
    }
}

public struct WeaponDetail: Codable {
    public let id: String
    public let name: String
    public let weaponType: String
    public let weight: Double
    public let description: String
    public let imageURL: String
    public let locations: [String]
    public let stability: Int
    public let attackType: String
    public let critical: Int
    public let range: Int?
    public let skill: Skill?
    public let baseDamage: AttackKind
    public let aditionalDamage: AditionalDamage?
    public let requeriments: Requeriments
    public let bonuses: Bonuses
    public let defenses: AttackKind
    
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
        case requeriments = "requeriments"
        case bonuses = "bonuses"
        case defenses = "defenses"
    }
}

public struct AditionalDamage: Codable {
    public let bleed: Int
    public let poison: Int
    public let frost: Int
    
    enum CodingKeys: String, CodingKey {
        case bleed = "bleed"
        case poison = "poison"
        case frost = "frost"
    }
}

public struct AttackKind: Codable {
    public let magicalAdjust: Int?
    public let physical: Int
    public let magic: Int
    public let dark: Int?
    public let lightning: Int
    public let fire: Int
    
    enum CodingKeys: String, CodingKey {
        case magicalAdjust = "magical_adjust"
        case physical = "physical"
        case magic = "magic"
        case dark = "dark"
        case lightning = "lightning"
        case fire = "fire"
    }
}

public struct Bonuses: Codable {
    public let strength: String
    public let dexterity: String
    public let intelligence: String
    public let faith: String
    
    enum CodingKeys: String, CodingKey {
        case strength = "strength"
        case dexterity = "dexterity"
        case intelligence = "intelligence"
        case faith = "faith"
    }
}

public struct Requeriments: Codable {
    public let strength: Int
    public let dexterity: Int
    public let intelligence: Int
    public let faith: Int
    
    enum CodingKeys: String, CodingKey {
        case strength = "strength"
        case dexterity = "dexterity"
        case intelligence = "intelligence"
        case faith = "faith"
    }
}

public struct Skill: Codable {
    public let name: String
    public let description: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
    }
}
