//
//  RequestElementsDetail.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 10/21/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

protocol RequestElementsDetail {
    
    func retrieveWeaponDetail(weaponID: String, _ completion: @escaping (DarkArmoryResponse) -> ())
    func retrieveArmorDetail(armorID: String, _ completion: @escaping (DarkArmoryResponse) -> ())
    func retrieveRingDetail(ringID: String, _ completion: @escaping (DarkArmoryResponse) -> ())
    func retrieveSpellDetail(spellID: String, _ completion: @escaping (DarkArmoryResponse) -> ())
    func retrieveMiscDetail(miscID: String, _ completion: @escaping (DarkArmoryResponse) -> ())
    
}
