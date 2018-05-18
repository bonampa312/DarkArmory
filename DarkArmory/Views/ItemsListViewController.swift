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
    var presenter : ItemsListPresenter!
    var objectsType : GameObjects?
    var enemiesType : GameCharacter?
    var listType : ListType?

    //MARK: - Outlet variables
    @IBOutlet weak var listTitleLabel: UILabel!
    @IBOutlet weak var gameTitleLabel: UILabel!
    
    //MARK: - View lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = ItemsListPresenter(view: self, listType: listType, objectsType: objectsType, enemiesType: enemiesType)
        
        self.configureUI()
    }

    //MARK: - UI methods
    private func configureUI () {
        gameTitleLabel.text = SoulsGameSingleton.getGlobalGame().rawValue
    }
}

extension ItemsListViewController : ItemsListView {
    func updateList() {
        //TODO
    }
    
    func updateListTitle() {
        self.listTitleLabel.text = presenter.listTitle
    }
    
    func updateListSubtitle() {
        self.gameTitleLabel.text = presenter.globalGame.rawValue
    }
    
    func showConnectionError() {
        //TODO
    }
    
    func showDataErrror() {
        //TODO
    }
    
    
}
