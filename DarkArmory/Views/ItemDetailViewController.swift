//
//  ItemDetailViewController.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 10/22/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {

    //MARK: - Class variables
    var presenter : ItemDetailBasePresenter?
    var elementsType : GameElement?
    var elementBasicData : ElementBasicData?
    
    var itemDetailContentView : UIView?
    
    @IBOutlet weak var itemDetailTitleLabel: UILabel!
    @IBOutlet weak var gameTitleLabel: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var notificationStack: UIStackView!
    @IBOutlet weak var notificationMessage: UILabel!
    @IBOutlet weak var detailContentContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailContentContainerView.isHidden = true
        
        guard let elements = elementsType, let basicData = elementBasicData else {
            presenter = ItemDetailWeaponPresenter(view: self, locator: UseCaseLocator(service: DarkArmoryAPIService()), gameBasics: ElementBasicData(name: "Claymore", id: "5aef98705c050400144181e8"))
            configureUI()
            return
        }
        presenter = ItemDetailPresenterFactory.getItemDetailPresenter(type: elements, view: self, elementBasicData: basicData)
        configureUI()
    }
    
    @IBAction func reloadDetail(_ sender: UIButton) {
        self.hideNotificationStack()
        self.loadingIndicator.isHidden = false
        self.loadingIndicator.startAnimating()
        self.presenter?.loadElement()
    }
    
    //MARK: - UI methods
    private func configureUI () {
        self.hideNotificationStack()
        self.loadingIndicator.isHidden = false
        self.loadingIndicator.startAnimating()
        self.presenter!.configureUI()
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "returnToItemsList":
            let itemsList = segue.destination as! ItemsListViewController
            itemsList.elementsType = self.elementsType
        default:
            return
        }
    }
    
    @IBAction func returnToItemsList(_ sender: Any) {
        performSegue(withIdentifier: "returnToItemsList", sender: self)
    }
}

//MARK:  - Presenter closure methods
extension ItemDetailViewController : ItemDetailView {
    func updateDetailData() {
        self.loadingIndicator.isHidden = true
        self.hideNotificationStack()
        self.loadDetailViewContent()
        guard let innerView = itemDetailContentView else {
            return
        }
    
        detailContentContainerView.addSubview(innerView)
        
        innerView.translatesAutoresizingMaskIntoConstraints = false
        innerView.addConstraintsToFillSuperview()

        self.itemDetailContentView = innerView
        detailContentContainerView.isHidden = false
    }
    
    func updateTitles() {
        self.itemDetailTitleLabel.text = self.presenter?.elementDetailTitle
        self.gameTitleLabel.text = self.presenter?.globalGame.rawValue
        self.presenter?.loadElement()
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

extension ItemDetailViewController {
    
    func hideNotificationStack() {
        self.notificationStack.alpha = 0
    }
    
    func showNotificationStack(){
        self.notificationStack.alpha = 1
    }
}
