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
    var globalGame: SoulsSeriesGame
    var locator: UseCaseLocatorProtocol
    
    var listTitle: String
    var cellIdentifier: String
    
    required init(view: ItemsListView, locator: UseCaseLocatorProtocol) {
        self.view = view
        self.locator = locator
        globalGame = SoulsGame.shared.game
        listTitle = GameElement.Armors.rawValue
        list = [ArmorsShort]()
        cellIdentifier = ArmorsTableViewCell.reuseIdentifier
    }
    
    func configureUI() {
        self.view.updateTitles()
    }
    
    func loadList() {
        guard let listRequester = self.locator.getUseCase(ofType: RequestElementsList.self) else { return }
        listRequester.retrieveArmorsList { [weak self] (response) in
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
