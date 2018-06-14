//
//  ItemsListRingsPresenter.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/25/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

class ItemsListRingsPresenter : ItemsListMediator {
    
    var cellIdentifier: String
    typealias T = RingShort
    var list: [RingShort]
    
    var view: ItemsListView
    var locator: UseCaseLocatorProtocol
    var globalGame: SoulsSeriesGame
    var listTitle: String
    
    required init(view: ItemsListView, locator: UseCaseLocatorProtocol) {
        self.view = view
        self.locator = locator
        self.globalGame = SoulsGame.shared.game
        self.listTitle = GameElement.Rings.rawValue
        self.list = [RingShort]()
        self.cellIdentifier = RingsTableViewCell.reuseIdentifier
    }
    
    func configureUI() {
        self.view.updateTitles()
    }
    
    func loadList() {
        guard let listRequester = self.locator.getUseCase(ofType: RequestElementsList.self) else { return }
        listRequester.retrieveRingsList { [weak self] (response) in
            guard let strongSelf = self else { return }
            switch response {
            case .successRingsList(let ringsResponse):
                strongSelf.list = ringsResponse
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
