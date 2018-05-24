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
        
        presenter = ItemsListPresenter(view: self, service: DarkArmoryAPIService(), listType: listType, objectsType: objectsType, enemiesType: enemiesType)
        
        self.configureUI()
    }

    //MARK: - UI methods
    private func configureUI () {
        self.presenter.configureUI()
    }
}

extension ItemsListViewController : ItemsListView {
    func updateList() {
        //TODO
    }
    
    func updateTitles() {
        self.listTitleLabel.text = self.presenter.listTitle
        self.gameTitleLabel.text = self.presenter.globalGame.rawValue
    }
    
    func showConnectionError() {
        //TODO
    }
    
    func showDataErrror() {
        //TODO
    }
    
    
}
