//
//  DarkArmoryAPIService.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/17/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation
import Alamofire

class DarkArmoryAPIRouter {
    
    private static let baseURL = "https://darkarmory-api.herokuapp.com"
    
    private static let imagesResizeBase = "/revision/latest/scale-to-width-down/"
    
    static func getImageResizedURL(url: String, size: Int) -> URL? {
        let url = URL(string: "\(url + imagesResizeBase + String(size))")
        return url
    }
    
    static func getURL(listType: GameElement) -> String {
        let baseGame = SoulsGameSingleton.getGlobalGame().shortName
        switch listType {
        case .Weapons:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/weapons"
        case .Rings:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/rings"
        case .Spells:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/spells"
        case .Armors:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/armors"
        case .Misc:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/miscs"
        case .RegularEnemy:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/regularEnemies"
        case .BossEnemy:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/bosses"
        case .Friendly:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/friendlyNPCs"
        case .Merchants:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/merchants"
        }
    }
    
}

