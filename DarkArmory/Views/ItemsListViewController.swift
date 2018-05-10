//
//  ItemsListViewController.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 4/24/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

class ItemsListViewController: UIViewController {

    var itemsType : GameElementType = .Weapons
    
    @IBOutlet weak var listTitleLabel: UILabel!
    
    //MARK: - View lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }

    //MARK: - UI methods
    
    private func configureUI () {
        listTitleLabel.text = itemsType.rawValue
    }
}
