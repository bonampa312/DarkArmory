//
//  DarkArmoryAPIService.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/17/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation
import Alamofire

enum RequestResponse {
    case failure
    case notConnectedToInternet
    case success(json: Data)
}

class DarkArmoryAPIService : DarkArmoryService {
    
    func retrieveWeaponsList(completion: @escaping (DarkArmoryResponse) -> Void) {
        let router : DarkArmoryAPIRouter = .Weapons
        guard let url = URL(string: router.fullPath) else { return }
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
                if response.result.value != nil, response.data != nil {
                    var allWeapons = [WeaponList]()
                    allWeapons = try! JSONDecoder().decode([WeaponList].self, from: response.data!)
                    for weapon in allWeapons {
                        print(weapon.name," : ",weapon.weight)
                    }
                    completion(.successWeaponsList(weapons: allWeapons))
                } else {
                    completion(.failure)
                }
            case NSURLErrorNotConnectedToInternet:
                completion(.notConnectedToInternet)
            default:
                completion(.failure)
            }
        }
    }
}
