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
        case .Armors:
            return ItemDetailArmorPresenter(view: view, locator: UseCaseLocator(service: DarkArmoryAPIService()), gameBasics: elementBasicData)
        case .Misc:
            return ItemDetailMiscPresenter(view: view, locator: UseCaseLocator(service: DarkArmoryAPIService()), gameBasics: elementBasicData)
        case .Rings:
            return ItemDetailRingPresenter(view: view, locator: UseCaseLocator(service: DarkArmoryAPIService()), gameBasics: elementBasicData)
        case .Spells:
            return ItemDetailSpellPresenter(view: view, locator: UseCaseLocator(service: DarkArmoryAPIService()), gameBasics: elementBasicData)
        case .Weapons:
            return ItemDetailWeaponPresenter(view: view, locator: UseCaseLocator(service: DarkArmoryAPIService()), gameBasics: elementBasicData)
        default:
            return ItemDetailWeaponPresenter(view: view, locator: UseCaseLocator(service: DarkArmoryAPIService()), gameBasics: elementBasicData)
        }
    }
}
