//
//  GameObjects.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 4/24/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

enum GameObjects : String {
    case Armors
    case Weapons
    case Rings
    case Spells
    case Misc
}

extension GameObjects {
    static var allTypes: [GameObjects] {
        var a: [GameObjects] = []
        switch GameObjects.Armors {
        case .Armors: a.append(.Armors); fallthrough
        case .Weapons: a.append(.Weapons); fallthrough
        case .Rings: a.append(.Rings); fallthrough
        case .Spells: a.append(.Spells); fallthrough
        case .Misc: a.append(.Misc)
        }
        return a
    }
}
