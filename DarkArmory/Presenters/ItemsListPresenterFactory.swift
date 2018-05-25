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
            return ItemsListWeaponsPresenter(view: view, service: DarkArmoryAPIService())
        case .Rings:
            return ItemsListRingsPresenter(view: view, service: DarkArmoryAPIService())
        default:
            return ItemsListWeaponsPresenter(view: view, service: DarkArmoryAPIService())
        }
    }
}
