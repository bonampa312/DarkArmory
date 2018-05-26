//
//  ItemsListRingsPresenter.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/25/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

class ItemsListRingsPresenter : ItemsListMediator {
    
    typealias T = RingShort
    var list: [RingShort]
    
    var view: ItemsListView
    var service: DarkArmoryService
    var globalGame: SoulsSeriesGame
    var listTitle: String
    
    required init(view: ItemsListView, service: DarkArmoryService) {
        self.view = view
        self.service = service
        self.globalGame = SoulsGameSingleton.getGlobalGame()
        self.listTitle = GameElement.Rings.rawValue
        self.list = [RingShort]()
    }
    
    func configureUI() {
        self.view.updateTitles()
    }
    
    func loadList() {
        self.service.retrieveRingsList { [weak self] (response) in
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
}
