//
//  ItemDetailPresenterFactory.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 10/23/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation
import UIKit

struct ItemDetailPresenterFactory {
    static func getItemDetailPresenter(type: GameElement, view: ItemDetailView, elementBasicData: ElementBasicData) -> ItemDetailBasePresenter {
        switch type {
        case .Weapons:
            return ItemDetailWeaponPresenter(view: view, locator: UseCaseLocator(service: DarkArmoryAPIService()), gameBasics: elementBasicData)
            // TODO - add the others
        default:
            return ItemDetailWeaponPresenter(view: view, locator: UseCaseLocator(service: DarkArmoryAPIService()), gameBasics: elementBasicData)
        }
    }
}
