//
//  ItemsListWeaponsPresenter.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/24/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

class ItemsListWeaponsPresenter : ItemsListMediator {
    
    var cellIdentifier: String
    typealias T = WeaponShort
    var list: [WeaponShort]
    
    var view: ItemsListView
    var locator: UseCaseLocatorProtocol
    var globalGame: SoulsSeriesGame
    var listTitle: String
    
    required init(view: ItemsListView, locator: UseCaseLocatorProtocol) {
        self.view = view
        self.locator = locator
        self.globalGame = SoulsGame.shared.game
        self.listTitle = GameElement.Weapons.rawValue
        self.list = [WeaponShort]()
        self.cellIdentifier = WeaponsTableViewCell.reuseIdentifier
    }
    
    func configureUI() {
        self.view.updateTitles()
    }
    
    func loadList() {
        guard let listRequester = self.locator.getUseCase(ofType: RequestElementsList.self) else { return }
        listRequester.retrieveWeaponsList { [weak self] (response) in
            guard let strongSelf = self else { return }
            switch response {
            case .success(let weaponsResponse):
                strongSelf.list = weaponsResponse
                strongSelf.view.updateList()
            case .failure:
                strongSelf.view.showDataErrror()
            case .notConnectedToInternet:
                strongSelf.view.showConnectionError()
            }
        }
    }
    
    func listSize() -> Int {
        return list.count
    }
}
