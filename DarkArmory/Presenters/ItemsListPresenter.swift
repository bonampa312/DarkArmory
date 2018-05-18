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
    func updateListTitle()
    func updateListSubtitle()
    func showConnectionError()
    func showDataErrror()
}

final class ItemsListPresenter {
    
    //MARK: - View that implements presenter
    unowned fileprivate var view : ItemsListView
    
    //MARK: - Class variables
    var listType : DarkArmoryAPIRouter?
    var globalGame : SoulsSeriesGame {
        didSet {
            self.view.updateListSubtitle()
        }
    }
    
    //MARK: - View elements variables
    var listTitle : String {
        didSet {
            self.view.updateListTitle()
        }
    }
    
    init(view : ItemsListView, listType: ListType?, objectsType: GameObjects?, enemiesType: GameCharacter?) {
        self.view = view
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
            }
        }
    }
    
}
