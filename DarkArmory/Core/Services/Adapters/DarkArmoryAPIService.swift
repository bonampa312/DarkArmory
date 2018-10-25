//
//  DarkArmoryAPIService.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/17/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation
import Alamofire

//MARK: Response possible values generic
fileprivate enum RequestResponse {
    case failure
    case notConnectedToInternet
    case success(json: Data)
}

class DarkArmoryAPIService : DarkArmoryService {
    
    //MARK: - Lists of elements
    
    func retrieveWeaponsList(completion: @escaping (DarkArmoryResponse) -> Void) {
        let route = DarkArmoryAPIRouter.getURL(listType: .Weapons)
        getJSONDataFromURL(urlPath: route) {
            switch $0 {
            case .success(let jsonData):
                var allWeapons = [WeaponShort]()
                allWeapons = try! JSONDecoder().decode([WeaponShort].self, from: jsonData)
                completion(.successWeaponsList(weapons: allWeapons))
            case .failure:
                completion(.failure)
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            }
        }
    }
    
    func retrieveRingsList(completion: @escaping (DarkArmoryResponse) -> Void) {
        let route = DarkArmoryAPIRouter.getURL(listType: .Rings)
        getJSONDataFromURL(urlPath: route) {
            switch $0 {
            case .success(let jsonData):
                var allRings = [RingShort]()
                allRings = try! JSONDecoder().decode([RingShort].self, from: jsonData)
                completion(.successRingsList(rings: allRings))
            case .failure:
                completion(.failure)
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            }
        }
    }
    
    func retrieveMiscList(completion: @escaping (DarkArmoryResponse) -> Void) {
        let route = DarkArmoryAPIRouter.getURL(listType: .Misc)
        getJSONDataFromURL(urlPath: route) {
            switch $0 {
            case .success(let jsonData):
                var allMisc = [MiscShort]()
                allMisc = try! JSONDecoder().decode([MiscShort].self, from: jsonData)
                completion(.successMiscList(miscs: allMisc))
            case .failure:
                completion(.failure)
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            }
        }
    }
    
    func retrieveSpellsList(completion: @escaping (DarkArmoryResponse) -> Void) {
        let route = DarkArmoryAPIRouter.getURL(listType: .Spells)
        getJSONDataFromURL(urlPath: route) {
            switch $0 {
            case .success(let jsonData):
                var allSpells = [SpellShort]()
                allSpells = try! JSONDecoder().decode([SpellShort].self, from: jsonData)
                completion(.successSpellsList(spells: allSpells))
            case .failure:
                completion(.failure)
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            }
        }
    }
    
    func retrieveArmorsList(completion: @escaping (DarkArmoryResponse) -> Void) {
        let route = DarkArmoryAPIRouter.getURL(listType: .Armors)
        getJSONDataFromURL(urlPath: route) {
            switch $0 {
            case .success(let jsonData):
                var allArmors = [ArmorsShort]()
                allArmors = try! JSONDecoder().decode([ArmorsShort].self, from: jsonData)
                completion(.successArmorsList(armors: allArmors))
            case .failure:
                completion(.failure)
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            }
        }
    }
    
    //MARK: - Elements details
    
    func retrieveWeaponDetail(weaponID: String, completion: @escaping (DarkArmoryResponse) -> Void) {
        let route = DarkArmoryAPIRouter.getURL(listType: .Weapons, detailID: weaponID)
        getJSONDataFromURL(urlPath: route) {
            switch $0 {
            case .success(let jsonData):
                let weaponData = try! JSONDecoder().decode(WeaponDetail.self, from: jsonData)
                completion(.successWeaponDetail(weapon: weaponData))
            case .failure:
                completion(.failure)
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            }
        }
    }
    
    func retrieveRingDetail(ringID: String, completion: @escaping (DarkArmoryResponse) -> Void) {
        let route = DarkArmoryAPIRouter.getURL(listType: .Rings, detailID: ringID)
        getJSONDataFromURL(urlPath: route) {
            switch $0 {
            case .success(let jsonData):
                let ringData = try! JSONDecoder().decode(RingDetail.self, from: jsonData)
                completion(.successRingDetail(ring: ringData))
            case .failure:
                completion(.failure)
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            }
        }
    }
    
    func retrieveMiscDetail(miscID: String, completion: @escaping (DarkArmoryResponse) -> Void) {
        let route = DarkArmoryAPIRouter.getURL(listType: .Misc, detailID: miscID)
        getJSONDataFromURL(urlPath: route) {
            switch $0 {
            case .success(let jsonData):
                let miscData = try! JSONDecoder().decode(MiscDetail.self, from: jsonData)
                completion(.successMiscDetail(misc: miscData))
            case .failure:
                completion(.failure)
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            }
        }
    }
    
    func retrieveSpellDetail(spellID: String, completion: @escaping (DarkArmoryResponse) -> Void) {
        let route = DarkArmoryAPIRouter.getURL(listType: .Spells, detailID: spellID)
        getJSONDataFromURL(urlPath: route) {
            switch $0 {
            case .success(let jsonData):
                let spellData = try! JSONDecoder().decode(SpellDetail.self, from: jsonData)
                completion(.successSpellDetail(spell: spellData))
            case .failure:
                completion(.failure)
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            }
        }
    }
    
    func retrieveArmorDetail(armorID: String, completion: @escaping (DarkArmoryResponse) -> Void) {
        let route = DarkArmoryAPIRouter.getURL(listType: .Armors, detailID: armorID)
        getJSONDataFromURL(urlPath: route) {
            switch $0 {
            case .success(let jsonData):
                let armorData = try! JSONDecoder().decode(ArmorDetail.self, from: jsonData)
                completion(.successArmorDetail(armor: armorData))
            case .failure:
                completion(.failure)
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            }
        }
    }
}

//MARK - Retrieve data
extension DarkArmoryAPIService {
    fileprivate func getJSONDataFromURL(urlPath: String, completion: @escaping (RequestResponse) -> Void) {
        guard let url = URL(string: urlPath) else { return }
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
                completion(.success(json: data))
            case NSURLErrorNotConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
}
