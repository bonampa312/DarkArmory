//
//  CommonData.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/25/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

struct AttackKind: Codable {
    let magicalAdjust: Float?
    let physical: Float
    let magic: Float
    let dark: Float?
    let lightning: Float
    let fire: Float
    
    enum CodingKeys: String, CodingKey {
        case magicalAdjust = "magical_adjust"
        case physical = "physical"
        case magic = "magic"
        case dark = "dark"
        case lightning = "lightning"
        case fire = "fire"
    }
}

struct Bonuses: Codable {
    let strength: String
    let dexterity: String
    let intelligence: String
    let faith: String
    
    enum CodingKeys: String, CodingKey {
        case strength = "strength"
        case dexterity = "dexterity"
        case intelligence = "intelligence"
        case faith = "faith"
    }
}

struct Requirements: Codable {
    let strength: Int
    let dexterity: Int
    let intelligence: Int
    let faith: Int
    
    enum CodingKeys: String, CodingKey {
        case strength = "strength"
        case dexterity = "dexterity"
        case intelligence = "intelligence"
        case faith = "faith"
    }
}

struct PhysicalAttackTypes: Codable {
    let strike: Double
    let slash: Double
    let thrust: Double
    
    enum CodingKeys: String, CodingKey {
        case strike = "strike"
        case slash = "slash"
        case thrust = "thrust"
    }
}

struct Resistances: Codable {
    let bleed: Int
    let poison: Int
    let curse: Int?
    let frost: Int?
    let petrification: Int?
    
    enum CodingKeys: String, CodingKey {
        case bleed = "bleed"
        case poison = "poison"
        case curse = "curse"
        case frost = "frost"
        case petrification = "petrification"
    }
}
