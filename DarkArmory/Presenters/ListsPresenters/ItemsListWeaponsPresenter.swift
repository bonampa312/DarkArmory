//
//  ItemsListWeaponsPresenter.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/24/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

class ItemsListWeaponsPresenter : ItemsListMediator {
    
    typealias T = WeaponList
    var list: [WeaponList]
    
    var view: ItemsListView
    var service: DarkArmoryService
    var listType: GameElement
    var globalGame: SoulsSeriesGame
    var listTitle: String
    
    required init(view: ItemsListView, service: DarkArmoryService) {
        self.view = view
        self.service = service
        self.globalGame = SoulsGameSingleton.getGlobalGame()
        self.listType = .Weapons
        self.listTitle = self.listType.rawValue
        self.list = [WeaponList]()
    }
    
    
    func configureUI() {
        switch self.listType {
        case .Weapons:
            self.service.retrieveWeaponsList { [weak self] (response) in
                guard let strongSelf = self else { return }
                switch response {
                case .successWeaponsList(let weaponsResponse):
                    strongSelf.list = weaponsResponse
                default:
                    return
                }
                strongSelf.view.updateTitles()
            }
        default:
            return
        }
    }
    
}
/// The Protocol with an associated type
protocol ExampleAssociatedProtocol {
    associatedtype Value
    
    /// Retrieving the actual associated type
    var value: Value { get }
}

/// Conform to the `ExampleProtocol`
extension ExampleAssociatedProtocol {
    var anyValue: Any {
        return value
    }
}
