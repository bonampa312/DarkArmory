//
//  ItemsListArmorsPresenter.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 6/1/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

class ItemsListArmorsPresenter : ItemsListMediator {
    
    typealias T = ArmorsShort
    var list: [ArmorsShort]
    
    var view: ItemsListView
    var service: DarkArmoryService
    var globalGame: SoulsSeriesGame
    
    var listTitle: String
    var cellIdentifier: String
    
    required init(view: ItemsListView, service: DarkArmoryService) {
        self.view = view
        self.service = service
        self.globalGame = SoulsGameSingleton.getGlobalGame()
        self.listTitle = GameElement.Armors.rawValue
        self.list = [ArmorsShort]()
        self.cellIdentifier = ArmorsTableViewCell.reuseIdentifier
    }
    
    func configureUI() {
        self.view.updateTitles()
    }
    
    func loadList() {
        self.service.retrieveArmorsList { [weak self] (response) in
            guard let strongSelf = self else { return }
            switch response {
            case .successArmorsList(let armorsResponse):
                strongSelf.list = armorsResponse
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
    
    func listSize() -> Int {
        return list.count
    }
    
    
}
