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
    
    //MARK: - Get weapons list
    func retrieveWeaponsList(completion: @escaping (DarkArmoryResponse) -> Void) {
        let route = DarkArmoryAPIRouter.getURL(listType: .Weapons)
        getListData(urlPath: route) {
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
    
    //MARK: - Get rings list
    func retrieveRingsList(completion: @escaping (DarkArmoryResponse) -> Void) {
        let route = DarkArmoryAPIRouter.getURL(listType: .Rings)
        getListData(urlPath: route) {
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
    
    //MARK: - Get miscs list
    func retrieveMiscList(completion: @escaping (DarkArmoryResponse) -> Void) {
        let route = DarkArmoryAPIRouter.getURL(listType: .Misc)
        getListData(urlPath: route) {
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
    
    //MARK: - Get spells list
    func retrieveSpellsList(completion: @escaping (DarkArmoryResponse) -> Void) {
        let route = DarkArmoryAPIRouter.getURL(listType: .Spells)
        getListData(urlPath: route) {
            switch $0 {
            case .success(let jsonData):
                var allSpells = [SpellsShort]()
                allSpells = try! JSONDecoder().decode([SpellsShort].self, from: jsonData)
                completion(.successSpellsList(spells: allSpells))
            case .failure:
                completion(.failure)
            case .notConnectedToInternet:
                completion(.notConnectedToInternet)
            }
        }
    }
    
    //MARK: - Get spells list
    func retrieveArmorsList(completion: @escaping (DarkArmoryResponse) -> Void) {
        let route = DarkArmoryAPIRouter.getURL(listType: .Armors)
        getListData(urlPath: route) {
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
}

//MARK - Retrieve data
extension DarkArmoryAPIService {
    fileprivate func getListData(urlPath: String, completion: @escaping (RequestResponse) -> Void) {
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
