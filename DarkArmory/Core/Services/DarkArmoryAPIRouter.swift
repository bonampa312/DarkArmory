//
//  DarkArmoryAPIService.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/17/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation
import Alamofire

enum DarkArmoryAPIRouter {
    private static let baseURL = "https://darkarmory-api.herokuapp.com"
    
    case Weapons
    case Rings
    case Armors
    case Spells
    case Misc
    case RegularEnemies
    case Bosses
    case FriendlyNPCs
    case Merchants
    
    var fullPath: String {
        let baseGame = SoulsGameSingleton.getGlobalGame().shortName
        switch self {
        case .Weapons:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/weapons"
        case .Rings:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/rings"
        case .Spells:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/spells"
        case .Armors:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/armors"
        case .Misc:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/misc"
        case .RegularEnemies:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/regularEnemies"
        case .Bosses:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/bosses"
        case .FriendlyNPCs:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/friendlyNPCs"
        case .Merchants:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/merchants"
        }
    }
}

