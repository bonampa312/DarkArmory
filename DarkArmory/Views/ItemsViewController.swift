//
//  ViewController.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 4/3/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {
    
    //MARK: - Class variables
    
    var gameSeries : SoulsSeriesGame = .DarkSouls1
    
    //MARK: - View background outlets
    
    @IBOutlet weak var backgroundFaraam: UIImageView!
    @IBOutlet weak var backgroundFilter: UIImageView!
    
    //MARK: - View elements outlets
    
    @IBOutlet weak var fireButton: UIStackView!
    @IBOutlet weak var weaponsButton: UICustomButton!
    @IBOutlet weak var armorsButton: UICustomButton!
    @IBOutlet weak var ringsButton: UICustomButton!
    @IBOutlet weak var spellsButton: UICustomButton!
    @IBOutlet weak var miscButton: UICustomButton!
    @IBOutlet weak var currentGameTitle: UILabel!
    
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
    
    private func configureUI () {
        currentGameTitle.text = SoulsGameSingleton.getGlobalGame().rawValue
        
        backgroundFaraam.alpha = 0
        backgroundFilter.alpha = 0
        fireButton.alpha = 0
        
        weaponsButton.setTitle(GameElementType.Weapons.rawValue, for: UIControlState.normal)
        weaponsButton.alpha = 0
        armorsButton.setTitle(GameElementType.Armors.rawValue, for: UIControlState.normal)
        armorsButton.alpha = 0
        spellsButton.setTitle(GameElementType.Spells.rawValue, for: UIControlState.normal)
        spellsButton.alpha = 0
        ringsButton.setTitle(GameElementType.Rings.rawValue, for: UIControlState.normal)
        ringsButton.alpha = 0
        miscButton.setTitle(GameElementType.Misc.rawValue, for: UIControlState.normal)
        miscButton.alpha = 0
        
    }

    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "itemsListSegue":
            let itemList = segue.destination as! ItemsListViewController
            guard let button = sender as? UIButton else { return }
            switch button {
            case weaponsButton:
                itemList.itemsType = .Weapons
            case armorsButton:
                itemList.itemsType = .Armors
            case ringsButton:
                itemList.itemsType = .Rings
            case spellsButton:
                itemList.itemsType = .Spells
            case miscButton:
                itemList.itemsType = .Misc
            default:
                itemList.itemsType = .Weapons
            }
        case "returnToBonfireSegue":
            _ = segue.destination as! SoulsCalculatorViewController
        case "changeGameSegue":
            _ = segue.destination as! SelectGameViewController
        default:
            return
        }
        
    }
    
    @IBAction func shotItemsList(_ sender: UIButton) {
        performSegue(withIdentifier: "itemsListSegue", sender: sender)
    }
    
    @IBAction func returnToBonfire(_ sender: UIButton) {
        performSegue(withIdentifier: "returnToBonfireSegue", sender: sender)
    }
    
    @IBAction func unwindList(for unwindSegue: UIStoryboardSegue) {
        self.configureUI()
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
        self.animateButton(button: weaponsButton)
        self.animateButton(button: armorsButton)
        self.animateButton(button: ringsButton)
        self.animateButton(button: spellsButton)
        self.animateButton(button: miscButton)
    }
    
    func animateButton(button : UIButton) {
        button.transform = CGAffineTransform(scaleX: 0, y: 0)
        button.alpha = 1
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            button.transform = .identity
        })
    }
    
    func animateReturnButton() {
        UIView.animate(withDuration: 0.3, animations: {
            self.fireButton.alpha = 1
        })
    }
    
}
