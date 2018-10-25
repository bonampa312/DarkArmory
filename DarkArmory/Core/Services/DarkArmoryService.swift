//
//  DarkArmoryService.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/17/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

enum DarkArmoryResponse {
    //MARK: - Completions for errors
    case failure
    case notConnectedToInternet
    //MARK: - Completions for lists
    case successWeaponsList(weapons: [WeaponShort])
    case successRingsList(rings: [RingShort])
    case successMiscList(miscs: [MiscShort])
    case successSpellsList(spells: [SpellShort])
    case successArmorsList(armors: [ArmorsShort])
    //MARK: - Completions for details
    case successWeaponDetail(weapon: WeaponDetail)
    case successRingDetail(ring: RingDetail)
    case successMiscDetail(misc: MiscDetail)
    case successSpellDetail(spell: SpellDetail)
    case successArmorDetail(armor: ArmorDetail)
}

protocol DarkArmoryService {
    //MARK: - Functions for lists
    func retrieveWeaponsList(completion: @escaping (DarkArmoryResponse) -> Void)
    func retrieveRingsList(completion: @escaping (DarkArmoryResponse) -> Void)
    func retrieveMiscList(completion: @escaping (DarkArmoryResponse) -> Void)
    func retrieveSpellsList(completion: @escaping (DarkArmoryResponse) -> Void)
    func retrieveArmorsList(completion: @escaping (DarkArmoryResponse) -> Void)
    //MARK: - Functions for details
    func retrieveWeaponDetail(weaponID: String, completion: @escaping (DarkArmoryResponse) -> Void)
    func retrieveRingDetail(ringID: String, completion: @escaping (DarkArmoryResponse) -> Void)
    func retrieveMiscDetail(miscID: String, completion: @escaping (DarkArmoryResponse) -> Void)
    func retrieveSpellDetail(spellID: String, completion: @escaping (DarkArmoryResponse) -> Void)
    func retrieveArmorDetail(armorID: String, completion: @escaping (DarkArmoryResponse) -> Void)
}
