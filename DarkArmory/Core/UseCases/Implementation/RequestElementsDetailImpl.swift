//
//  RequestElementsDetailImpl.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 10/21/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

final class RequestElementsDetailImpl : UseCaseWithServiceImplementation, RequestElementsDetail {
    func retrieveWeaponDetail(weaponID: String, _ completion: @escaping (DarkArmoryResponse) -> ()) {
        service.retrieveWeaponDetail(weaponID: weaponID) {
            switch $0 {
            case .successWeaponDetail(let weaponData):
                completion(.successWeaponDetail(weapon: weaponData))
            case .failure:
                completion(.failure)
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
    
    func retrieveArmorDetail(armorID: String, _ completion: @escaping (DarkArmoryResponse) -> ()) {
        service.retrieveArmorDetail(armorID: armorID) {
            switch $0 {
            case .successArmorDetail(let armorData):
                completion(.successArmorDetail(armor: armorData))
            case .failure:
                completion(.failure)
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
    
    func retrieveRingDetail(ringID: String, _ completion: @escaping (DarkArmoryResponse) -> ()) {
        service.retrieveRingDetail(ringID: ringID) {
            switch $0 {
            case .successRingDetail(let ringData):
                completion(.successRingDetail(ring: ringData))
            case .failure:
                completion(.failure)
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
    
    func retrieveSpellDetail(spellID: String, _ completion: @escaping (DarkArmoryResponse) -> ()) {
        service.retrieveSpellDetail(spellID: spellID) {
            switch $0 {
            case .successSpellDetail(let spellData):
                completion(.successSpellDetail(spell: spellData))
            case .failure:
                completion(.failure)
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
    
    func retrieveMiscDetail(miscID: String, _ completion: @escaping (DarkArmoryResponse) -> ()) {
        service.retrieveMiscDetail(miscID: miscID) {
            switch $0 {
            case .successMiscDetail(let miscData):
                completion(.successMiscDetail(misc: miscData))
            case .failure:
                completion(.failure)
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
    
    
}
