//
//  DarkArmoryAPIService.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/17/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation
import Alamofire

//MARK: Response possible values
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
                var allWeapons = [WeaponList]()
                allWeapons = try! JSONDecoder().decode([WeaponList].self, from: jsonData)
                completion(.successWeaponsList(weapons: allWeapons))
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
