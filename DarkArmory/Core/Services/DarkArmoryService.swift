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
    case successWeaponsList(weapons: [WeaponShort])
    case successRingsList(rings: [RingShort])
    case successMiscList(miscs: [MiscShort])
    case successSpellsList(spells: [SpellsShort])
}

protocol DarkArmoryService {
    
    func retrieveWeaponsList(completion: @escaping (DarkArmoryResponse) -> Void)
    func retrieveRingsList(completion: @escaping (DarkArmoryResponse) -> Void)
    func retrieveMiscList(completion: @escaping (DarkArmoryResponse) -> Void)
    func retrieveSpellsList(completion: @escaping (DarkArmoryResponse) -> Void)
    
}
