//
//  ItemsListPresenterFactory.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/25/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation
import UIKit

struct ItemsListPresenterFactory {
    static func getItemsListPresenter(type: GameElement, view: ItemsListView) -> ItemsListBasePresenter {
        switch type {
        case .Weapons:
            return ItemsListWeaponsPresenter(view: view, locator: UseCaseLocator(service: DarkArmoryAPIService()))
        case .Rings:
            return ItemsListRingsPresenter(view: view, locator: UseCaseLocator(service: DarkArmoryAPIService()))
        case .Misc:
            return ItemsListMiscPresenter(view: view, locator: UseCaseLocator(service: DarkArmoryAPIService()))
        case .Spells:
            return ItemsListSpellsPresenter(view: view, locator: UseCaseLocator(service: DarkArmoryAPIService()))
        case .Armors:
            return ItemsListArmorsPresenter(view: view, locator: UseCaseLocator(service: DarkArmoryAPIService()))
        default:
            return ItemsListWeaponsPresenter(view: view, locator: UseCaseLocator(service: DarkArmoryAPIService()))
        }
    }
}
