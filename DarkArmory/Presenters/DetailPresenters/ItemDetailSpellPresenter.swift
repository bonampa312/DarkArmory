//
//  ItemDetailSpellPresenter.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 10/25/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

class ItemDetailSpellPresenter : ItemDetailMediator {
    
    typealias T = SpellDetail
    var element: SpellDetail?
    
    var view: ItemDetailView
    var detailView: UIView?
    
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
        guard let elementRequester = self.locator.getUseCase(ofType: RequestElementsDetail.self) else { return }
        elementRequester.retrieveSpellDetail(spellID: self.gameBasics.elementID!) { [weak self] (response) in
            guard let strongSelf = self else { return }
            switch response {
            case .successSpellDetail(let spellResponse):
                strongSelf.element = spellResponse
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
    
    func getDetailView() -> UIView {
        //TODO Change this thing
//        guard let nibView = WeaponDetailView.instantiateFromNib() else {
//            return UIView()
//        }
//        nibView.element = element
//        return nibView
        return UIView()
    }
    
}
