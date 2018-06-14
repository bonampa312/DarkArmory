//
//  DarkArmoryAPIService.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/17/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation
import Alamofire

class DarkArmoryAPIService : DarkArmoryService {
    
    //MARK: - Get weapons list
    func retrieveWeaponsList(completion: @escaping (DarkArmoryResponse<[WeaponShort]>) -> Void) {
        let route = DarkArmoryAPIRouter.getURL(listType: .Weapons)
        guard let url = URL(string: route) else { return }
        Alamofire.request(url).responseJSON { response in
            guard let urlResponse = response.response else {
                if let error = response.result.error as NSError?, error.code == NSURLErrorNotConnectedToInternet {
                    completion(.notConnectedToInternet)
                } else {
                    completion(.failure)
                }
                return
            }
            switch urlResponse.statusCode {
            case 200:
                guard (response.result.value != nil), let data = response.data else {
                    completion(.failure)
                    return
                }
                var allWeapons = [WeaponShort]()
                allWeapons = try! JSONDecoder().decode([WeaponShort].self, from: data)
                completion(.success(list: allWeapons))
            case NSURLErrorNotConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
    
    //MARK: - Get rings list
    func retrieveRingsList(completion: @escaping (DarkArmoryResponse<[RingShort]>) -> Void) {
        let route = DarkArmoryAPIRouter.getURL(listType: .Rings)
        guard let url = URL(string: route) else { return }
        Alamofire.request(url).responseJSON { response in
            guard let urlResponse = response.response else {
                if let error = response.result.error as NSError?, error.code == NSURLErrorNotConnectedToInternet {
                    completion(.notConnectedToInternet)
                } else {
                    completion(.failure)
                }
                return
            }
            switch urlResponse.statusCode {
            case 200:
                guard (response.result.value != nil), let data = response.data else {
                    completion(.failure)
                    return
                }
                var allRings = [RingShort]()
                allRings = try! JSONDecoder().decode([RingShort].self, from: data)
                completion(.success(list: allRings))
            case NSURLErrorNotConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
    
    //MARK: - Get miscs list
    func retrieveMiscList(completion: @escaping (DarkArmoryResponse<[MiscShort]>) -> Void) {
        let route = DarkArmoryAPIRouter.getURL(listType: .Misc)
        guard let url = URL(string: route) else { return }
        Alamofire.request(url).responseJSON { response in
            guard let urlResponse = response.response else {
                if let error = response.result.error as NSError?, error.code == NSURLErrorNotConnectedToInternet {
                    completion(.notConnectedToInternet)
                } else {
                    completion(.failure)
                }
                return
            }
            switch urlResponse.statusCode {
            case 200:
                guard (response.result.value != nil), let data = response.data else {
                    completion(.failure)
                    return
                }
                var allMisc = [MiscShort]()
                allMisc = try! JSONDecoder().decode([MiscShort].self, from: data)
                completion(.success(list: allMisc))
            case NSURLErrorNotConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
    
    //MARK: - Get spells list
    func retrieveSpellsList(completion: @escaping (DarkArmoryResponse<[SpellsShort]>) -> Void) {
        let route = DarkArmoryAPIRouter.getURL(listType: .Spells)
        guard let url = URL(string: route) else { return }
        Alamofire.request(url).responseJSON { response in
            guard let urlResponse = response.response else {
                if let error = response.result.error as NSError?, error.code == NSURLErrorNotConnectedToInternet {
                    completion(.notConnectedToInternet)
                } else {
                    completion(.failure)
                }
                return
            }
            switch urlResponse.statusCode {
            case 200:
                guard (response.result.value != nil), let data = response.data else {
                    completion(.failure)
                    return
                }
                var allSpells = [SpellsShort]()
                allSpells = try! JSONDecoder().decode([SpellsShort].self, from: data)
                completion(.success(list: allSpells))
            case NSURLErrorNotConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
    
    //MARK: - Get spells list
    func retrieveArmorsList(completion: @escaping (DarkArmoryResponse<[ArmorsShort]>) -> Void) {
        let route = DarkArmoryAPIRouter.getURL(listType: .Armors)
        guard let url = URL(string: route) else { return }
        Alamofire.request(url).responseJSON { response in
            guard let urlResponse = response.response else {
                if let error = response.result.error as NSError?, error.code == NSURLErrorNotConnectedToInternet {
                    completion(.notConnectedToInternet)
                } else {
                    completion(.failure)
                }
                return
            }
            switch urlResponse.statusCode {
            case 200:
                guard (response.result.value != nil), let data = response.data else {
                    completion(.failure)
                    return
                }
                var allArmors = [ArmorsShort]()
                allArmors = try! JSONDecoder().decode([ArmorsShort].self, from: data)
                completion(.success(list: allArmors))
            case NSURLErrorNotConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
}
