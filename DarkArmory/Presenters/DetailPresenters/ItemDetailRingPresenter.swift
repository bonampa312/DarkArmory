//
//  ItemDetailRingPresenter.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 10/25/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

class ItemDetailRingPresenter : ItemDetailMediator {
    
    typealias T = RingDetail
    var element: RingDetail?
    
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
    }
    
    func configureUI() {
        self.view.updateTitles()
    }
    
    func loadElement() {
        guard let elementRequester = self.locator.getUseCase(ofType: RequestElementsDetail.self), let elementID = self.gameBasics.elementID else { return }
        elementRequester.retrieveRingDetail(ringID: elementID) { [weak self] (response) in
            guard let strongSelf = self else { return }
            switch response {
            case .successRingDetail(let ringResponse):
                strongSelf.element = ringResponse
                strongSelf.view.updateDetailData()
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
