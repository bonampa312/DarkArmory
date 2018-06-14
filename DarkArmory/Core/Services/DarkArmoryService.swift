//
//  DarkArmoryService.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/17/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

enum DarkArmoryResponse<T> {
    case failure
    case notConnectedToInternet
    case success(list: T)
}

protocol DarkArmoryService {
    
    func retrieveWeaponsList(completion: @escaping (DarkArmoryResponse<[WeaponShort]>) -> Void)
    func retrieveRingsList(completion: @escaping (DarkArmoryResponse<[RingShort]>) -> Void)
    func retrieveMiscList(completion: @escaping (DarkArmoryResponse<[MiscShort]>) -> Void)
    func retrieveSpellsList(completion: @escaping (DarkArmoryResponse<[SpellsShort]>) -> Void)
    func retrieveArmorsList(completion: @escaping (DarkArmoryResponse<[ArmorsShort]>) -> Void)
    
}
