//
//  GameCharacter.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/10/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

enum GameCharacter : String {
    case RegularEnemy = "Regular enemies"
    case BossEnemy = "☠️ Bosses"
    case Friendly = "Friendly NPC's"
    case Merchants = "Merchants"
}

extension GameCharacter {
    static var allTypes: [GameCharacter] {
        var a: [GameCharacter] = []
        switch GameCharacter.RegularEnemy {
        case .RegularEnemy: a.append(.RegularEnemy); fallthrough
        case .BossEnemy: a.append(.BossEnemy); fallthrough
        case .Friendly: a.append(.Friendly); fallthrough
        case .Merchants: a.append(.Merchants)
        }
        return a
    }
}
