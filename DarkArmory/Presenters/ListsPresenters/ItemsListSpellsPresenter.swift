//
//  ItemsListSpellsPresenter.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/30/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

class ItemsListSpellsPresenter : ItemsListMediator {
    
    typealias T = SpellsShort
    var list: [SpellsShort]
    
    var view: ItemsListView
    var service: DarkArmoryService
    var globalGame: SoulsSeriesGame
    var listTitle: String
    
    var cellIdentifier: String
    
    required init(view: ItemsListView, service: DarkArmoryService) {
        self.view = view
        self.service = service
        self.globalGame = SoulsGameSingleton.getGlobalGame()
        self.listTitle = GameElement.Spells.rawValue
        self.list = [SpellsShort]()
        self.cellIdentifier = SpellsTableViewCell.reuseIdentifier
    }
    
    func configureUI() {
        self.view.updateTitles()
    }
    
    func loadList() {
        self.service.retrieveSpellsList { [weak self] (response) in
            guard let strongSelf = self else { return }
            switch response {
            case .successSpellsList(let spellsResponse):
                strongSelf.list = spellsResponse
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
