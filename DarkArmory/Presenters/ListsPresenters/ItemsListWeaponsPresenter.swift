//
//  ItemsListWeaponsPresenter.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/24/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

class ItemsListWeaponsPresenter : ItemsListMediator {
    
    typealias T = WeaponShort
    var list: [WeaponShort]
    
    var view: ItemsListView
    var service: DarkArmoryService
    var globalGame: SoulsSeriesGame
    var listTitle: String
    
    required init(view: ItemsListView, service: DarkArmoryService) {
        self.view = view
        self.service = service
        self.globalGame = SoulsGameSingleton.getGlobalGame()
        self.listTitle = GameElement.Weapons.rawValue
        self.list = [WeaponShort]()
    }
    
    func configureUI() {
        self.view.updateTitles()
    }
    
    func loadList() {
        self.service.retrieveWeaponsList { [weak self] (response) in
            guard let strongSelf = self else { return }
            switch response {
            case .successWeaponsList(let weaponsResponse):
                strongSelf.list = weaponsResponse
                strongSelf.view.updateList()
            case .failure:
                strongSelf.view.showDataErrror()
            case .notConnectedToInternet:
                strongSelf.view.showConnectionError()
            default:
                return
            }
        }
    }
}
