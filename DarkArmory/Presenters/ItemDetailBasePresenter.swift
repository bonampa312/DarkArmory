//
//  ItemDetailPresenter.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 10/22/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

protocol ItemDetailView : class {
    func updateDetailData()
    func updateTitles()
    func showConnectionError()
    func showDataErrror()
}

protocol ItemDetailBasePresenter {
    
    //MARK: - View that implements presenter
    var view: ItemDetailView { get }
    
    //MARK: - Class variables
    var locator: UseCaseLocatorProtocol { get }
    var globalGame: SoulsSeriesGame { get }
    var gameBasics: ElementBasicData { get }
    
    //MARK: - View element variables
    var elementDetailTitle: String { get }
    var elementDetail: Any { get }
    
    init(view: ItemDetailView, locator: UseCaseLocatorProtocol, gameBasics: ElementBasicData)
    
    func configureUI()
    
    func loadElement()
    
}
