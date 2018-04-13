//
//  ViewController.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 4/3/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

class TODOYouDiedViewController: UIViewController {
    @IBOutlet weak var backgroundFaraam: UIImageView!
    @IBOutlet weak var backgroundFilter: UIImageView!
    @IBOutlet weak var youDiedTitle: UILabel!
    @IBOutlet weak var againSubtitle: UILabel!
    @IBOutlet weak var goToBonfireLabel: UILabel!
    @IBOutlet weak var fireButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundFaraam.alpha = 0
        backgroundFilter.alpha = 0
        youDiedTitle.alpha = 0
        againSubtitle.alpha = 0
        goToBonfireLabel.alpha = 0
        fireButton.alpha = 0
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.2, animations: {
            self.backgroundFaraam.alpha = 1
        }) { (true) in
            self.animateBgFilter()
        }
    }
    
    func animateBgFilter () {
        UIView.animate(withDuration: 0.9, animations: {
            self.backgroundFilter.alpha = 0.45
        }, completion: { (true) in
            self.animateYouDiedTitle()
        })
    }
    
    func animateYouDiedTitle () {
        UIView.animate(withDuration: 0.7, animations: {
            self.youDiedTitle.alpha = 1
        }, completion: { (true) in
            self.animateTexts()
        })
    }
    
    func animateTexts() {
        UIView.animate(withDuration: 0.7, animations: {
            self.againSubtitle.alpha = 1
        }) { (true) in
            self.animateButtonAndButtonText()
        }
    }
    
    func animateButtonAndButtonText() {
        UIView.animate(withDuration: 0.3, animations: {
            self.goToBonfireLabel.alpha = 1
            self.fireButton.alpha = 1
        })
    }

}

