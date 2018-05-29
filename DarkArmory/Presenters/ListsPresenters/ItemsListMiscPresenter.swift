//
//  ItemsListMiscPresenter.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/29/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

class ItemsListMiscPresenter : ItemsListMediator {
    
    var cellIdentifier: String
    typealias T = MiscShort
    var list: [MiscShort]
    
    var view: ItemsListView
    var service: DarkArmoryService
    var globalGame: SoulsSeriesGame
    var listTitle: String
    
    required init(view: ItemsListView, service: DarkArmoryService) {
        self.view = view
        self.service = service
        self.globalGame = SoulsGameSingleton.getGlobalGame()
        self.listTitle = GameElement.Misc.rawValue
        self.list = [MiscShort]()
        self.cellIdentifier = MiscsTableViewCell.reuseIdentifier
    }
    
    func configureUI() {
        self.view.updateTitles()
    }
    
    func loadList() {
        self.service.retrieveMiscList { [weak self] (response) in
            guard let strongSelf = self else { return }
            switch response {
            case .successMiscList(let miscResponse):
                strongSelf.list = miscResponse
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
