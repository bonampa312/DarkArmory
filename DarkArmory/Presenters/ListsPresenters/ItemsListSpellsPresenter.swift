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
    var locator: UseCaseLocatorProtocol
    var globalGame: SoulsSeriesGame
    
    var listTitle: String
    var cellIdentifier: String
    
    required init(view: ItemsListView, locator: UseCaseLocatorProtocol) {
        self.view = view
        self.locator = locator
        globalGame = SoulsGame.shared.game
        listTitle = GameElement.Spells.rawValue
        list = [SpellsShort]()
        cellIdentifier = SpellsTableViewCell.reuseIdentifier
    }
    
    func configureUI() {
        self.view.updateTitles()
    }
    
    func loadList() {
        guard let listRequester = self.locator.getUseCase(ofType: RequestElementsList.self) else { return }
        listRequester.retrieveSpellsList { [weak self] (response) in
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
