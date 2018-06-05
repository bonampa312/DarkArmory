//
//  RequestElementsList.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 6/5/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

final class RequestElementsListImpl : UseCaseWithServiceImplementation, RequestElementsList {
    
    func retrieveWeaponsList(_ completion: @escaping (DarkArmoryResponse) -> ()) {
        service.retrieveWeaponsList {
            switch $0 {
            case .successWeaponsList(let weapons):
                completion(.successWeaponsList(weapons: weapons))
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
    
    func retrieveArmorsList(_ completion: @escaping (DarkArmoryResponse) -> ()) {
        service.retrieveArmorsList {
            switch $0 {
            case .successArmorsList(let armors):
                completion(.successArmorsList(armors: armors))
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
    
    func retrieveRingsList(_ completion: @escaping (DarkArmoryResponse) -> ()) {
        service.retrieveRingsList {
            switch $0 {
            case .successRingsList(let rings):
                completion(.successRingsList(rings: rings))
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
    
    func retrieveSpellsList(_ completion: @escaping (DarkArmoryResponse) -> ()) {
        service.retrieveSpellsList {
            switch $0 {
            case .successSpellsList(let spells):
                completion(.successSpellsList(spells: spells))
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
    
    func retrieveMiscsList(_ completion: @escaping (DarkArmoryResponse) -> ()) {
        service.retrieveMiscList {
            switch $0 {
            case .successMiscList(let miscs):
                completion(.successMiscList(miscs: miscs))
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
}
