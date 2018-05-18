//
//  SoulsSeriesGame.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 4/13/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

enum SoulsSeriesGame : String {
    case DarkSouls1 = "Dark Souls"
    case DarkSouls2 = "Dark Souls II"
    case DarkSouls3 = "Dark Souls III"
}

extension SoulsSeriesGame {
    var shortName : String {
        switch self {
        case .DarkSouls1:
            return "ds1"
        case .DarkSouls2:
            return "ds2"
        case .DarkSouls3:
            return "ds3"
        }
    }
}
