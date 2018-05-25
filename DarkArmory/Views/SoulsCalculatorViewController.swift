//
//  SoulsCalculatorViewController.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 4/3/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

class SoulsCalculatorViewController: UIViewController {
    
    //MARK: - Class variables
    
    var presenter : SoulsCalculatorPresenter!
    var placeName : String!
    var buttonsOriginalCenters : [String : CGRect]!
    
    //MARK: - Main view outlets
    
    @IBOutlet weak var solaireMenu: UIButton!
    @IBOutlet weak var soulLevel: UIStackView!
    @IBOutlet weak var objectsButtonView: UIStackView!
    @IBOutlet weak var enemiesButtonView: UIStackView!
    @IBOutlet weak var currentGameNameLabel: UILabel!
    @IBOutlet weak var bonfireBackground: UIImageView!
    
    //MARK: - Souls calculator outlets
    
    @IBOutlet weak var soulsCalculatorView: UICustomView!
    @IBOutlet weak var currentLevelLabel: UITextField!
    @IBOutlet weak var targetLevelLabel: UITextField!
    @IBOutlet weak var messageTitle: UILabel!
    @IBOutlet weak var calculateButton: UICustomButton!
    @IBOutlet weak var soulsAmountLabel: UILabel!
    @IBOutlet weak var soulsAmountStack: UIStackView!
    @IBOutlet weak var searchAgainButton: UIButton!
    
    //MARK: - View lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        let game = SoulsGameSingleton.getGlobalGame()
        
        presenter = SoulsCalculatorPresenter(view: self, game: game, locator: UseCaseLocator())
        
        self.configureUI()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.addGifBackground()
        
        buttonsOriginalCenters = [
            "teleport" : soulLevel.frame,
            "slayMonster" : objectsButtonView.frame,
            "diedInCombat" : enemiesButtonView.frame
        ]
        
        soulLevel.frame = solaireMenu.frame
        enemiesButtonView.frame = solaireMenu.frame
        objectsButtonView.frame = solaireMenu.frame
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        soulLevel.frame = solaireMenu.frame
        enemiesButtonView.frame = solaireMenu.frame
        objectsButtonView.frame = solaireMenu.frame
        
        solaireMenu.alpha = 1
        
    }
    
    //MARK: - UI methods
    
    private func configureUI () {
        
        self.hideOptionsButtons()
        
        soulsAmountStack.isHidden = true
        
        solaireMenu.alpha = 1
        soulLevel.alpha = 0
        enemiesButtonView.alpha = 0
        objectsButtonView.alpha = 0
        
        soulsCalculatorView.alpha = 0
        
        currentGameNameLabel.text = SoulsGameSingleton.getGlobalGame().rawValue
        
    }
    
    private func addGifBackground() {
        
        let bonfireAnimatedImage = UIImage.gifImageWithName(name: "bonfireAnimated")
        let bonfireAnimatedImageView = UIImageView(image: bonfireAnimatedImage)
        bonfireAnimatedImageView.frame = CGRect(x: 0, y: 0, width: bonfireBackground.frame.width, height: bonfireBackground.frame.height)
        
        bonfireBackground.addSubview(bonfireAnimatedImageView)
        
    }
    
    //MARK: - Buttons actions functions
    
    @IBAction func solaireTapped(_ sender: UIButton) {
        
        if solaireMenu.alpha == 1 {
            self.showOptionsButtons()
        } else {
            self.hideOptionsButtons()
        }
        toggleAlphaFor(view: sender)
        
    }
    
    @IBAction func objectsButtonTapped(_ sender: UIButton) {
        toggleAlphaFor(view : objectsButtonView)
        performSegue(withIdentifier: "itemsListSegue", sender: objectsButtonView)
    }
    
    @IBAction func enemiesButtonTapped(_ sender: UIButton) {
        toggleAlphaFor(view : enemiesButtonView)
        performSegue(withIdentifier: "itemsListSegue", sender: enemiesButtonView)
    }
    
    @IBAction func toggleSoulsCalculator(_ sender: UIButton) {
        
        if soulsCalculatorView.alpha == 1 {
            exitCalculator()
        } else {
            showCalculator()
        }
        
    }
    
    @IBAction func calculateSouls(_ sender: UIButton) {
        
        view.endEditing(true)
        toggleCalculateButton(hide : true)
        
    }
    
    @IBAction func exitCalculator(_ sender: UIButton) {
        exitCalculator()
    }
    
    @IBAction func searchAgain(_ sender: UIButton) {
        toggleCalculateButton(hide: false)
    }
    
    //MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        self.exitCalculator()
        switch segue.identifier! {
        case "selectGameSegue":
            _ = segue.destination as! SelectGameViewController
        case "itemsListSegue":
            let itemsListController = segue.destination as! SelectListViewController
            itemsListController.gameSeries = SoulsGameSingleton.getGlobalGame()
            guard let button = sender as? UIStackView else { return }
            switch button {
            case objectsButtonView:
                itemsListController.itemsType = .Objects
            case enemiesButtonView:
                itemsListController.itemsType = .Characters
            default :
                itemsListController.itemsType = .Objects
            }
        default:
            return
        }
        
    }
    
    @IBAction func unwindToSoulsCalculator(for unwindSegue: UIStoryboardSegue) {
        
        configureUI()
        
        presenter.gameFromSeries = SoulsGameSingleton.getGlobalGame()
        
    }
}


//MARK: - Animation methods

extension SoulsCalculatorViewController {
    
    func showOptionsButtons () {
        
        self.soulLevel.frame = self.solaireMenu.frame
        self.enemiesButtonView.frame = self.solaireMenu.frame
        self.objectsButtonView.frame = self.solaireMenu.frame
        
        UIView.animate(withDuration: 0.4, animations: {
            
            self.bonfireBackground.alpha = 0.3
            self.soulLevel.alpha = 1
            self.enemiesButtonView.alpha = 1
            self.objectsButtonView.alpha = 1
            self.soulLevel.frame = self.buttonsOriginalCenters["teleport"]!
            self.objectsButtonView.frame = self.buttonsOriginalCenters["slayMonster"]!
            self.enemiesButtonView.frame = self.buttonsOriginalCenters["diedInCombat"]!
        })
        
    }
    
    func hideOptionsButtons () {
        
        UIView.animate(withDuration: 0.4, animations: {
            
            self.bonfireBackground.alpha = 0.6
            self.soulLevel.alpha = 0
            self.enemiesButtonView.alpha = 0
            self.objectsButtonView.alpha = 0
            self.soulLevel.frame = self.solaireMenu.frame
            self.enemiesButtonView.frame = self.solaireMenu.frame
            self.objectsButtonView.frame = self.solaireMenu.frame
            if self.soulsCalculatorView.alpha == 1 {
                self.soulsCalculatorView.alpha = 0
            }
            
        })
        
    }
    
    func toggleAlphaFor(view : UIView){
        
        UIView.animate(withDuration: 0.1) {
            view.alpha = view.alpha == 1 ? 0.6 : 1
        }
        
    }
    
    func exitCalculator () {
        
        toggleAlphaFor(view: self.soulLevel)
        resetSoulsCalculation()
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
            self.soulsCalculatorView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            self.soulsCalculatorView.alpha = 0
        })
        
    }
    
    func showCalculator () {
        
        toggleAlphaFor(view : soulLevel)
        soulsCalculatorView.alpha = 1
        toggleCalculateButton(hide: false)
        soulsCalculatorView.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.soulsCalculatorView.transform = .identity
        })
        
    }
    
    func resetSoulsCalculation () {
        
        messageTitle.text = "Get dissapointed"
        soulsAmountLabel.text = ""
        currentLevelLabel.text = ""
        targetLevelLabel.text = ""
        UIView.transition(from: soulsAmountStack, to: calculateButton, duration: 0.2, options: [.showHideTransitionViews, .transitionCrossDissolve]) { (true) in
            self.soulsAmountStack.isHidden = true
        }
        
    }
    
    func toggleCalculateButton (hide : Bool) {
        
        var fromView : UIView!
        var toView : UIView!
        
        if hide {
            presenter.calculateTotalSouls(startLevel: currentLevelLabel.text, targetLevel: targetLevelLabel.text)
            fromView = calculateButton
            toView = soulsAmountStack
        } else {
            messageTitle.text = "Get dissapointed"
            soulsAmountLabel.text = ""
            toView = calculateButton
            fromView = soulsAmountStack
        }
        
        toView.isHidden = false
        
        UIView.transition(from: fromView, to: toView, duration: 0.5, options: [.showHideTransitionViews, .transitionCrossDissolve]) { (true) in
            fromView.isHidden = true
        }
        
    }
    
}


//MARK: - Text field delegate

extension SoulsCalculatorViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        return true
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
        
    }
}


//MARK: - Presenter protocol actions

extension SoulsCalculatorViewController : SoulsCalculatorView {
    
    func onUpdateSouls() {
        
        self.messageTitle.text = "Ok, you need..."
        self.soulsAmountLabel.text = "\(self.presenter.totalSouls) souls!"
        
    }
    
    func showErrorEmptyFields() {
        
        self.messageTitle.text = "Hollow levels!"
        self.soulsAmountLabel.text = ""
        
    }
    
    func showErrorOutOfRangeLevels () {
        
        self.messageTitle.text = "You can't achieve that levels!"
        self.soulsAmountLabel.text = ""
        
    }
}

