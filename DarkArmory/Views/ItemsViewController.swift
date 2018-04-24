//
//  ViewController.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 4/3/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {
    
    //MARK: - View background outlets
    
    @IBOutlet weak var backgroundFaraam: UIImageView!
    @IBOutlet weak var backgroundFilter: UIImageView!
    
    //MARK: - View elements outlets
    
    @IBOutlet weak var fireButton: UIStackView!
    @IBOutlet var itemTypeButtons: [UICustomButton]!
    
    //MARK: - View lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.animateBgImage()
    }

    //MARK: - UI methods
    
    func configureUI () {
        backgroundFaraam.alpha = 0
        backgroundFilter.alpha = 0
        fireButton.alpha = 0
        for button in itemTypeButtons {
            button.alpha = 0
        }
    }

}

//MARK: - Animations methods

extension ItemsViewController {
    
    func animateBgImage () {
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundFaraam.alpha = 1
        }) { (true) in
            self.animateBgFilter()
        }
    }
    
    func animateBgFilter () {
        UIView.animate(withDuration: 0.4, animations: {
            self.backgroundFilter.alpha = 0.45
        }, completion: { (true) in
            self.animateItemsTypeButton()
            self.animateReturnButton()
        })
    }
    
    func animateItemsTypeButton() {
        for button in itemTypeButtons {
            button.transform = CGAffineTransform(scaleX: 0, y: 0)
            button.alpha = 1
            UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                button.transform = .identity
            })
        }
    }
    
    func animateReturnButton() {
        UIView.animate(withDuration: 0.3, animations: {
            self.fireButton.alpha = 1
        })
    }
    
}
