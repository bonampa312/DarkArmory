//
//  DarkArmoryService.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/17/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

enum DarkArmoryResponse {
    case failure
    case notConnectedToInternet
    case successWeaponsList(weapons: [WeaponList])
    case successWeaponDetail(weapons: WeaponDetail)
}

protocol DarkArmoryService {
    func retrieveWeaponsList(completion: @escaping (DarkArmoryResponse) -> Void)
}
