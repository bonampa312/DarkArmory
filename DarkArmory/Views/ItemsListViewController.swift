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
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var notificationStack: UIStackView!
    @IBOutlet weak var notificationMessage: UILabel!
    
    //MARK: - View lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard elementsType != nil else {
            elementsType = .Weapons
            presenter = ItemsListWeaponsPresenter(view: self, service: DarkArmoryAPIService())
            configureUI()
            return
        }
        presenter = ItemsListPresenterFactory.getItemsListPresenter(type: elementsType!, view: self)
        configureUI()
    }
    
    @IBAction func reloadList(_ sender: UIButton) {
        self.hideNotificationStack()
        self.loadingIndicator.isHidden = false
        self.loadingIndicator.startAnimating()
        self.presenter?.loadList()
    }
    
    //MARK: - UI methods
    private func configureUI () {
        self.loadingIndicator.isHidden = false
        self.loadingIndicator.startAnimating()
        self.presenter!.configureUI()
    }
}

//MARK: - Presenter closure methods
extension ItemsListViewController : ItemsListView {
    func updateList() {
        self.loadingIndicator.isHidden = true
    }
    
    func updateTitles() {
        self.listTitleLabel.text = self.presenter?.listTitle
        self.gameTitleLabel.text = self.presenter?.globalGame.rawValue
        self.presenter?.loadList()
    }
    
    func showConnectionError() {
        self.loadingIndicator.isHidden = true
        self.notificationMessage.text = "No internet connection"
        self.showNotificationStack()
    }
    
    func showDataErrror() {
        self.loadingIndicator.isHidden = true
        self.notificationMessage.text = "Error loading data"
        self.showNotificationStack()
    }
}

extension ItemsListViewController {
    
    func hideNotificationStack() {
        self.notificationStack.alpha = 0
    }
    
    func showNotificationStack(){
        self.notificationStack.alpha = 1
    }
}
