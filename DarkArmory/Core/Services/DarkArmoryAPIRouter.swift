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
    
    static func getImageResizedURL(url: String, size: Int = 0) -> URL? {
        var urlString = ""
        if (size == 0) {
            urlString = url
        } else {
            urlString = "\(url + imagesResizeBase + String(size))"
        }
        let url = URL(string: urlString)
        return url
    }
    
    static func getURL(listType: GameElement, detailID: String? = nil) -> String {
        let baseGame = SoulsGameSingleton.getGlobalGame().shortName
        var idRouteAppend : String = ""
        if (detailID != nil) {
            idRouteAppend = "/" + detailID!
        }
        switch listType {
        case .Weapons:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/weapons\(idRouteAppend)"
        case .Rings:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/rings\(idRouteAppend)"
        case .Spells:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/spells\(idRouteAppend)"
        case .Armors:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/armors\(idRouteAppend)"
        case .Misc:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/miscs\(idRouteAppend)"
        case .RegularEnemy:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/regularEnemies\(idRouteAppend)"
        case .BossEnemy:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/bosses\(idRouteAppend)"
        case .Friendly:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/friendlyNPCs\(idRouteAppend)"
        case .Merchants:
            return "\(DarkArmoryAPIRouter.baseURL)/\(baseGame)/merchants\(idRouteAppend)"
        }
    }
    
}

