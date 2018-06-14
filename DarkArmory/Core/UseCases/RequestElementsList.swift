//
//  RequestElementsList.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 6/5/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

protocol RequestElementsList {
    
    func retrieveWeaponsList(_ completion: @escaping (DarkArmoryResponse<[WeaponShort]>) -> ())
    func retrieveArmorsList(_ completion: @escaping (DarkArmoryResponse<[ArmorsShort]>) -> ())
    func retrieveRingsList(_ completion: @escaping (DarkArmoryResponse<[RingShort]>) -> ())
    func retrieveSpellsList(_ completion: @escaping (DarkArmoryResponse<[SpellsShort]>) -> ())
    func retrieveMiscsList(_ completion: @escaping (DarkArmoryResponse<[MiscShort]>) -> ())
    
}
