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
            return ItemsListWeaponsPresenter(view: view, locator: UseCaseLocator.darkArmoryAPILocator)
        case .Rings:
            return ItemsListRingsPresenter(view: view, locator: UseCaseLocator.darkArmoryAPILocator)
        case .Misc:
            return ItemsListMiscPresenter(view: view, locator: UseCaseLocator.darkArmoryAPILocator)
        case .Spells:
            return ItemsListSpellsPresenter(view: view, locator: UseCaseLocator.darkArmoryAPILocator)
        case .Armors:
            return ItemsListArmorsPresenter(view: view, locator: UseCaseLocator.darkArmoryAPILocator)
        default:
            return ItemsListWeaponsPresenter(view: view, locator: UseCaseLocator.darkArmoryAPILocator)
        }
    }
}
