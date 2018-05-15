//
//  ViewController.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 4/3/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

enum ListType {
    case Objects
    case Enemies
}

class ItemsViewController: UIViewController {
    
    //MARK: - Class variables
    var gameSeries : SoulsSeriesGame = .DarkSouls1
    var itemsType : ListType = .Objects
    var buttonsList : [UIButton] = []
    
    //MARK: - View background outlets
    @IBOutlet weak var backgroundFaraam: UIImageView!
    @IBOutlet weak var backgroundFilter: UIImageView!
    
    //MARK: - View elements outlets
    @IBOutlet weak var fireButton: UIStackView!
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
        
        if buttonsList.isEmpty {
            createButtonsStackView()
        }
    }

    private func createButtonsStackView() {
        // Array with buttons
        switch itemsType {
        case .Enemies:
            for characterType in GameCharacter.allTypes {
                buttonsList.append(createOptionsButton(title: characterType.rawValue))
            }
        case .Objects:
            for objectType in GameObjects.allTypes {
                buttonsList.append(createOptionsButton(title: objectType.rawValue))
            }
        }
        
        //Stack View
        let buttonsStackView = UIStackView(arrangedSubviews: buttonsList)
        buttonsStackView.axis = UILayoutConstraintAxis.vertical
        buttonsStackView.distribution = UIStackViewDistribution.fill
        buttonsStackView.alignment = UIStackViewAlignment.fill
        buttonsStackView.spacing = 12.0
        
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(buttonsStackView)
        
        //Constraints
        let viewSize = self.view.frame.size
        buttonsStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        buttonsStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        buttonsStackView.widthAnchor.constraint(equalToConstant: (viewSize.width-32.0) ).isActive = true
        
        self.view.layoutIfNeeded()
    }
    
    private func createOptionsButton(title : String) -> UIButton {
        let button = UICustomButton()
        button.widthAnchor.constraint(equalToConstant: 0)
        button.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        button.borderWidth = 1.0
        button.cornerRadius = 12.0
        button.titleLabel?.font = UIFont(name: "OptimusPrinceps", size: 24.0)
        button.setTitle(title, for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.alpha = 0
        button.addTarget(self, action: #selector(self.showItemsList(sender:)), for: .touchUpInside)
        return button
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "itemsListSegue":
            let itemList = segue.destination as! ItemsListViewController
            guard let button = sender as? UIButton,
                let buttonTitle = button.titleLabel?.text else { return }
            switch buttonTitle {
            case GameObjects.Weapons.rawValue:
                itemList.objectsType = .Weapons
                itemList.listType = .Objects
            case GameObjects.Armors.rawValue:
                itemList.objectsType = .Armors
                itemList.listType = .Objects
            case GameObjects.Rings.rawValue:
                itemList.objectsType = .Rings
                itemList.listType = .Objects
            case GameObjects.Spells.rawValue:
                itemList.objectsType = .Spells
                itemList.listType = .Objects
            case GameObjects.Misc.rawValue:
                itemList.objectsType = .Misc
                itemList.listType = .Objects
            case GameCharacter.RegularEnemy.rawValue:
                itemList.enemiesType = .RegularEnemy
                itemList.listType = .Enemies
            case GameCharacter.BossEnemy.rawValue:
                itemList.enemiesType = .BossEnemy
                itemList.listType = .Enemies
            case GameCharacter.Friendly.rawValue:
                itemList.enemiesType = .Friendly
                itemList.listType = .Enemies
            default:
                itemList.objectsType = .Weapons
                itemList.listType = .Objects
            }
        case "returnToBonfireSegue":
            _ = segue.destination as! SoulsCalculatorViewController
        case "changeGameSegue":
            _ = segue.destination as! SelectGameViewController
        default:
            return
        }
    }
    
    @objc func showItemsList(sender: UIButton) {
        performSegue(withIdentifier: "itemsListSegue", sender: sender)
    }
    
    @IBAction func returnToBonfire(_ sender: UIButton) {
        performSegue(withIdentifier: "returnToBonfireSegue", sender: sender)
    }
    
    @IBAction func unwindList(for unwindSegue: UIStoryboardSegue) {
        for button in buttonsList {
            button.alpha = 0
        }
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
        for button in buttonsList {
            self.animateButton(button: button)
        }
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
