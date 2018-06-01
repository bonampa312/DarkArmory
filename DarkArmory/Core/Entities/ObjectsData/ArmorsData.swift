//
//  ArmorsData.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 6/1/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

struct ArmorsShort: Codable {
    let id: String
    let name: String
    let weight: Float
    let type: Int
    let imageURL: String
    let defenses: AttackKind
    let physicalDefenses: PhysicalAttackTypes
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "name"
        case weight = "weight"
        case type = "type"
        case imageURL = "image_url"
        case defenses = "defenses"
        case physicalDefenses = "physical_defenses"
    }
}

struct ArmorsDetailElement: Codable {
    let id: String
    let name: String
    let weight: Float
    let type: Int
    let description: String
    let imageURL: String
    let locations: [String]
    let poise: Float
    let defenses: AttackKind
    let physicalDefenses: PhysicalAttackTypes
    let resistances: Resistances
    let game: String
    let effects: [String]?
    let requirements: Requirements?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "name"
        case weight = "weight"
        case type = "type"
        case description = "description"
        case imageURL = "image_url"
        case locations = "locations"
        case poise = "poise"
        case defenses = "defenses"
        case physicalDefenses = "physical_defenses"
        case resistances = "resistances"
        case game = "game"
        case effects = "effects"
        case requirements = "requirements"
    }
}

enum ArmorType : String{
    case Head, Chest, Legs, Hands
    
    static func getArmorType(byId id : Int) -> String {
        switch id {
        case 1:
            return self.Head.rawValue
        case 2:
            return self.Chest.rawValue
        case 3:
            return self.Legs.rawValue
        case 4:
            return self.Hands.rawValue
        default:
            return self.Head.rawValue
        }
    }
}
