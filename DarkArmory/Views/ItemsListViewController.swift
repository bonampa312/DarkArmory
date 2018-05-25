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
    var presenter : ItemsListBasePresenter?
    var elementsType : GameElement?

    //MARK: - Outlet variables
    @IBOutlet weak var listTitleLabel: UILabel!
    @IBOutlet weak var gameTitleLabel: UILabel!
    
    //MARK: - View lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard elementsType != nil else {
            elementsType = .Weapons
            presenter = ItemsListWeaponsPresenter(view: self, service: DarkArmoryAPIService())
            configureUI()
            return
        }
        switch elementsType! {
        case .Weapons:
            presenter = ItemsListWeaponsPresenter(view: self, service: DarkArmoryAPIService())
        default:
            presenter = ItemsListWeaponsPresenter(view: self, service: DarkArmoryAPIService())
        }
        configureUI()
    }

    //MARK: - UI methods
    private func configureUI () {
        self.presenter!.configureUI()
    }
}

extension ItemsListViewController : ItemsListView {
    func updateList() {
        //TODO
    }
    
    func updateTitles() {
        self.listTitleLabel.text = self.presenter?.listTitle
        self.gameTitleLabel.text = self.presenter?.globalGame.rawValue
    }
    
    func showConnectionError() {
        //TODO
    }
    
    func showDataErrror() {
        //TODO
    }
    
    
}
