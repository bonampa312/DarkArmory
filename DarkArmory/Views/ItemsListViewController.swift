//
//  ItemsListViewController.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 4/24/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

class ItemsListViewController: UIViewController {

    //MARK: - Class variables
    var objectsType : GameObjects?
    var enemiesType : GameCharacter?
    var listType : ListType?
    
    //MARK: - Outlet variables
    @IBOutlet weak var listTitleLabel: UILabel!
    @IBOutlet weak var gameTitleLabel: UILabel!
    
    //MARK: - View lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }

    //MARK: - UI methods
    private func configureUI () {
        
        gameTitleLabel.text = SoulsGameSingleton.getGlobalGame().rawValue
        
        guard let listType = listType else { return }
        switch listType {
        case .Objects:
            guard let objectsTypeTitle = objectsType?.rawValue else { return }
            listTitleLabel.text = objectsTypeTitle
            let service : DarkArmoryService = DarkArmoryAPIService() as DarkArmoryService
            service.retrieveWeaponsList(completion: { data in
                //TO DO
            })
        case .Enemies:
            guard let enemiesTypeTitle = enemiesType?.rawValue else { return }
            listTitleLabel.text = enemiesTypeTitle
        }
    }
}
