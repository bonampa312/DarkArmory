//
//  SelectGameViewController.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 4/3/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

class SelectGameViewController: UIViewController {
    
    //MARK: - Select Game view outlets
    
    @IBOutlet weak var menuBar: UIView!
    @IBOutlet weak var buttonBackground: UICustomView!
    @IBOutlet weak var showMenuButton: UIButton!
    @IBOutlet weak var ds1FirelinkButton: UIStackView!
    @IBOutlet weak var ds2FirelinkButton: UIStackView!
    @IBOutlet weak var ds3FirelinkButton: UIStackView!
    
    //MARK: - View lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Buttons actions functions
    
    @IBAction func toggleMenu(_ sender: UIButton) {
        if self.buttonBackground.transform == .identity {
            self.expandMenuButton()
        } else {
            self.collapseMenuButton()
        }
    }
    
    //MARK: - Prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        _ = segue.destination as! SoulsCalculatorViewController
        switch segue.identifier! {
        case "ds1FirelinkTravel":
            SoulsGameSingleton.setGame(game: .DarkSouls1)
        case "ds2FirelinkTravel":
            SoulsGameSingleton.setGame(game: .DarkSouls2)
        case "ds3FirelinkTravel":
            SoulsGameSingleton.setGame(game: .DarkSouls3)
        default:
            return
        }
    }
    
}


//MARK: - Animations methods

extension SelectGameViewController {
    
    func expandMenuButton () {
        UIView.animate(withDuration: 0.3, animations: {
            self.buttonBackground.transform = CGAffineTransform(scaleX: 10, y: 10)
        }) { (true) in
            self.menuBar.backgroundColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
            self.buttonBackground.alpha = 0
            self.showFullMenu()
        }
    }
    
    func collapseMenuButton () {
        UIView.animate(withDuration: 0.3, animations: {
            self.toggleVisiblePlacesButtons()
        }) { (true) in
            self.hideFullMenu()
        }
    }
    
    func showFullMenu () {
        UIView.animate(withDuration: 0.3, animations: {
            self.showMenuButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
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
            self.menuBar.backgroundColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
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
    
}

