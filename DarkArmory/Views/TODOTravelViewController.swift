//
//  TravelViewController.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 4/3/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

class TODOTravelViewController: UIViewController {

    @IBOutlet weak var menuBar: UIView!
    @IBOutlet weak var buttonBackground: UICustomView!
    @IBOutlet weak var showMenuButton: UIButton!
    @IBOutlet weak var ds1FirelinkButton: UICustomButton!
    @IBOutlet weak var ds2FirelinkButton: UICustomButton!
    @IBOutlet weak var ds3FirelinkButton: UICustomButton!
    
    let π = CGFloat.pi
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func toggleMenu(_ sender: UIButton) {
        if self.buttonBackground.transform == .identity {
            UIView.animate(withDuration: 0.3, animations: {
                self.buttonBackground.transform = CGAffineTransform(scaleX: 10, y: 10)
            }) { (true) in
                self.menuBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
                self.buttonBackground.alpha = 0
                self.showFullMenu()
            }
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                self.toggleVisiblePlacesButtons()
            }) { (true) in
                self.hideFullMenu()
            }
        }
    }
    
    func showFullMenu () {
        UIView.animate(withDuration: 0.3, animations: {
            self.showMenuButton.transform = CGAffineTransform(rotationAngle: self.π)
            self.menuBar.transform = CGAffineTransform(translationX: 0, y: -98)
        }) { (true) in
            self.toggleVisiblePlacesButtons()
        }
    }
    
    func hideFullMenu () {
        UIView.animate(withDuration: 0.3, animations: {
            self.showMenuButton.transform = .identity
            self.menuBar.transform = .identity
        }) { (true) in
            self.menuBar.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
            self.buttonBackground.alpha = 1
            self.showMenuButtonOriginal()
        }
    }
    
    func showMenuButtonOriginal () {
        UIView.animate(withDuration: 0.3) {
            self.buttonBackground.transform = .identity
        }
    }
    
    func toggleVisiblePlacesButtons () {
        let newAlpha : CGFloat = self.ds1FirelinkButton.alpha == 0 ? 1 : 0
        UIView.animate(withDuration: 0.3) {
            self.ds1FirelinkButton.alpha = newAlpha
            self.ds2FirelinkButton.alpha = newAlpha
            self.ds3FirelinkButton.alpha = newAlpha
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let soulCalculatorController = segue.destination as! SoulsCalculatorViewController
        switch segue.identifier! {
        case "ds1FirelinkTravel":
            soulCalculatorController.game = .DarkSouls1
        case "ds2FirelinkTravel":
            soulCalculatorController.game = .DarkSouls2
        case "ds3FirelinkTravel":
            soulCalculatorController.game = .DarkSouls3
        default:
            return
        }
    }
    
}
