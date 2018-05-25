//
//  GameElement.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/24/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

enum GameElement : String {

    case Weapons
    case Rings
    case Armors
    case Spells
    case Misc
    case RegularEnemy = "Regular enemies"
    case BossEnemy = "☠️ Bosses"
    case Friendly = "Friendly NPC's"
    case Merchants = "Merchants"

}

//MARK: - Objects
extension GameElement {
    static var allObjects: [GameElement] {
        var a: [GameElement] = []
        a.append(contentsOf: [.Armors, .Weapons, .Rings, .Spells, .Misc])
        return a
    }
}

//MARK: - Characters
extension GameElement {
    static var allCharacters: [GameElement] {
        var b: [GameElement] = []
        b.append(contentsOf: [.RegularEnemy, .BossEnemy, .Friendly, .Merchants])
        return b
    }
}
