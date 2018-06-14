//
//  RequestElementsList.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 6/5/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

final class RequestElementsListImpl : UseCaseWithServiceImplementation, RequestElementsList {
    
    func retrieveWeaponsList(_ completion: @escaping (DarkArmoryResponse<[WeaponShort]>) -> ()) {
        service.retrieveWeaponsList {
            switch $0 {
            case .success(let weapons):
                completion(.success(list: weapons))
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
    
    func retrieveArmorsList(_ completion: @escaping (DarkArmoryResponse<[ArmorsShort]>) -> ()) {
        service.retrieveArmorsList {
            switch $0 {
            case .success(let armors):
                completion(.success(list: armors))
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
    
    func retrieveRingsList(_ completion: @escaping (DarkArmoryResponse<[RingShort]>) -> ()) {
        service.retrieveRingsList {
            switch $0 {
            case .success(let rings):
                completion(.success(list: rings))
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
    
    func retrieveSpellsList(_ completion: @escaping (DarkArmoryResponse<[SpellsShort]>) -> ()) {
        service.retrieveSpellsList {
            switch $0 {
            case .success(let spells):
                completion(.success(list: spells))
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
    
    func retrieveMiscsList(_ completion: @escaping (DarkArmoryResponse<[MiscShort]>) -> ()) {
        service.retrieveMiscList {
            switch $0 {
            case .success(let miscs):
                completion(.success(list: miscs))
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
}
