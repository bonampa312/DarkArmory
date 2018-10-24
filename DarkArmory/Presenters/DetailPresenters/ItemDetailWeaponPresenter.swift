//
//  ItemDetailWeaponPresenter.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 10/22/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

class ItemDetailWeaponPresenter : ItemDetailMediator {
    
    typealias T = WeaponDetail
    var element: WeaponDetail?
    
    var view: ItemDetailView
    var locator: UseCaseLocatorProtocol
    var globalGame: SoulsSeriesGame
    var elementDetailTitle: String
    var gameBasics: ElementBasicData
    
    required init(view: ItemDetailView, locator: UseCaseLocatorProtocol, gameBasics: ElementBasicData) {
        self.view = view
        self.locator = locator
        self.globalGame = SoulsGameSingleton.getGlobalGame()
        self.gameBasics = gameBasics
        self.elementDetailTitle = gameBasics.elementName!
        self.element = nil
        
    }
    
    func configureUI() {
        self.view.updateTitles()
    }
    
    func loadElement() {
        self.view.updateDetailData()
    }
    
}
