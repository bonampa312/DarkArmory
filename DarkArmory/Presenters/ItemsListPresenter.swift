//
//  ItemsListPresenter.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/18/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

protocol ItemsListView : class {
    func updateList()
    func updateTitles()
    func showConnectionError()
    func showDataErrror()
}

final class ItemsListPresenter {
    
    //MARK: - View that implements presenter
    unowned fileprivate var view : ItemsListView
    
    //MARK: - Class variables
    var service : DarkArmoryService
    var listType : DarkArmoryAPIRouter
    var globalGame : SoulsSeriesGame
    
    //MARK: - View elements variables
    var listTitle : String
    
    init(view : ItemsListView, service: DarkArmoryService, listType: ListType?, objectsType: GameObjects?, enemiesType: GameCharacter?) {
        self.view = view
        self.service = service
        self.globalGame = SoulsGameSingleton.getGlobalGame()
        let listToShowType : ListType = (listType != nil) ? listType! : ListType.Objects
        switch listToShowType {
        case .Objects:
            guard let objects = objectsType else {
                self.listTitle = GameObjects.Weapons.rawValue
                self.listType = .Weapons
                return
            }
            // Set list title
            self.listTitle = objects.rawValue
            
            switch objects {
            case .Weapons:
                self.listType = .Weapons
            case .Armors:
                self.listType = .Armors
            case .Rings:
                self.listType = .Rings
            case .Spells:
                self.listType = .Spells
            case .Misc:
                self.listType = .Misc
            }
        case .Enemies:
            guard let enemies = enemiesType else {
                self.listTitle = GameCharacter.RegularEnemy.rawValue
                self.listType = .RegularEnemies
                return
            }
            // Set list title
            self.listTitle = enemies.rawValue
            
            switch enemies {
            case .RegularEnemy:
                self.listType = .RegularEnemies
            case .BossEnemy:
                self.listType = .Bosses
            case .Friendly:
                self.listType = .FriendlyNPCs
            case .Merchants:
                self.listType = .Merchants
            }
        }
    }
    
    func configureUI() {
        var weapons = [WeaponList]()
        switch self.listType {
        case .Weapons:
            self.service.retrieveWeaponsList { (response) in
                switch response {
                case .successWeaponsList(let weaponsResponse):
                    weapons = weaponsResponse
                default:
                    return
                }
            }
        default:
            return
        }
        self.view.updateTitles()
    }
    
}
