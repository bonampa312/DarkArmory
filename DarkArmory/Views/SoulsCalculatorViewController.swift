//
//  FirelinkShrineViewController.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 4/3/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

class SoulsCalculatorViewController: UIViewController {

    @IBOutlet weak var solaireMenu: UIButton!
    @IBOutlet weak var soulLevel: UIButton!
    @IBOutlet weak var objectsButton: UIButton!
    @IBOutlet weak var enemiesButton: UIButton!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var bonfireBackground: UIImageView!
    
    // Souls calculator outlets
    
    @IBOutlet weak var soulsCalculatorView: UICustomView!
    @IBOutlet weak var currentLevelLabel: UITextField!
    @IBOutlet weak var targetLevelLabel: UITextField!
    @IBOutlet weak var messageTitle: UILabel!
    @IBOutlet weak var calculateButton: UICustomButton!
    @IBOutlet weak var soulsAmountLabel: UILabel!
    @IBOutlet weak var soulsAmountStack: UIStackView!
    @IBOutlet weak var searchAgainButton: UIButton!
    
    var placeName : String!
    
    var buttonsOriginalCenters : [String : CGRect]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        soulsAmountStack.isHidden = true
        
        solaireMenu.alpha = 1
        soulLevel.alpha = 0
        enemiesButton.alpha = 0
        objectsButton.alpha = 0
        
        soulsCalculatorView.alpha = 0
        
        if let thisPlace = placeName {
            placeNameLabel.text = thisPlace
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let bonfireAnimatedImage = UIImage.gifImageWithName(name: "bonfireAnimated")
        let bonfireAnimatedImageView = UIImageView(image: bonfireAnimatedImage)
        bonfireAnimatedImageView.frame = CGRect(x: 0, y: 0, width: bonfireBackground.frame.width, height: bonfireBackground.frame.height)

        bonfireBackground.addSubview(bonfireAnimatedImageView)
        
        buttonsOriginalCenters = [
            "teleport" : soulLevel.frame,
            "slayMonster" : objectsButton.frame,
            "diedInCombat" : enemiesButton.frame
        ]
        
        soulLevel.frame = solaireMenu.frame
        enemiesButton.frame = solaireMenu.frame
        objectsButton.frame = solaireMenu.frame
        
    }
    
    @IBAction func solaireTapped(_ sender: UIButton) {
        if solaireMenu.alpha == 1 {
            UIView.animate(withDuration: 0.4, animations: {
                
                self.bonfireBackground.alpha = 0.3
                
                self.soulLevel.alpha = 1
                self.enemiesButton.alpha = 1
                self.objectsButton.alpha = 1
                
                self.soulLevel.frame = self.buttonsOriginalCenters["teleport"]!
                self.objectsButton.frame = self.buttonsOriginalCenters["slayMonster"]!
                self.enemiesButton.frame = self.buttonsOriginalCenters["diedInCombat"]!
            })
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                
                self.bonfireBackground.alpha = 0.6
                
                self.soulLevel.alpha = 0
                self.enemiesButton.alpha = 0
                self.objectsButton.alpha = 0
                
                self.soulLevel.frame = self.solaireMenu.frame
                self.enemiesButton.frame = self.solaireMenu.frame
                self.objectsButton.frame = self.solaireMenu.frame
                
                if self.soulsCalculatorView.alpha == 1 {
                    self.soulsCalculatorView.alpha = 0
                }
                
            })
        }
        toggleAlphaFor(button: sender)
    }
    
    @IBAction func slayMonsterTapped(_ sender: UIButton) {
        toggleAlphaFor(button: sender)
    }
    
    
    func toggleAlphaFor(button : UIButton) {
        UIView.animate(withDuration: 0.1) {
            button.alpha = button.alpha == 1 ? 0.6 : 1
        }
    }
    @IBAction func toggleSoulsCalculator(_ sender: UIButton) {
        toggleAlphaFor(button: sender)
        soulsCalculatorView.alpha = soulsCalculatorView.alpha == 1 ? 0 : 1
        toggleCalculateButton(hide: false)
        soulsCalculatorView.transform = CGAffineTransform(scaleX: 0, y: 0)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.soulsCalculatorView.transform = .identity
        }) { (true) in
            
        }
    }
    
    @IBAction func calculateSouls(_ sender: UIButton) {
        toggleCalculateButton(hide : true)
    }
    
    func toggleCalculateButton (hide : Bool) {
        
        var fromView : UIView!
        var toView : UIView!
        
        if hide {
            messageTitle.text = "Ok, you need..."
            soulsAmountLabel.text = "\(calculateSouls(startLevel: currentLevelLabel.text!, targetLevel: targetLevelLabel.text!)) souls!"
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
    
    @IBAction func exitCalculator(_ sender: UIButton) {
        exitCalculator()
    }
    
    @IBAction func searchAgain(_ sender: UIButton) {
        toggleCalculateButton(hide: false)
    }
    
    func exitCalculator () {
        soulsCalculatorView.alpha = 0
        toggleAlphaFor(button: soulLevel)
        toggleCalculateButton(hide: false)
    }
    
    func calculateSouls (startLevel : String, targetLevel : String)  -> String {
        
        let current = Int(startLevel)!
        let target = Int(targetLevel)!
        
        var soulsTillTarget : Double = 0
        if current < target {
            for soulsForLevel in current+1...target {
                soulsTillTarget += calculateSoulsForLordranAndLothric(level: soulsForLevel)
//                soulsTillTarget += calculateSoulsForDrangleic(level: soulsForLevel)
            }
        }
        return Int(soulsTillTarget.rounded()).withCommas()
    }
    
    
    func calculateSoulsForLordranAndLothric (level x : Int) -> Double {
        let firstLevels : [Double] = [0,0,673,690,707,724,741,758,775,793,811,829,847,1039,1238,1445,1660,1883,2114,2353]
        if x < 20 && x > 0 {
            return firstLevels[x]
        }
        let first = 0.02*(pow(Double(x),3))
        let scnd = 3.06*pow(Double(x),2)
        let thrd = 105.6*Double(x)
        return (first + scnd + thrd - 895)
    }
    
    func calculateSoulsForDrangleic (level x : Int) -> Double {

        var totalSouls = 0.0

        if x <= 170 {
            let first = 0.0000537*(pow(Double(x),4))
            let scnd = -0.0144*(pow(Double(x),3))
            let thrd = 2.33*pow(Double(x),2)
            let frth = -12.5*Double(x)
            totalSouls = (first + scnd + thrd + frth + 686)
        } else if x <= 180  {
            let first = 3.065*pow(Double(x),2)
            let scnd = -557*Double(x)
            totalSouls = (first + scnd + 46865)
        } else if x <= 200 {
            let first = 1.56*pow(Double(x),2)
            let scnd = -201*Double(x)
            totalSouls = (first + scnd + 30951)
        } else if x <= 250 {
            let first = 0.889*(pow(Double(x),3))
            let scnd = -522*pow(Double(x),2)
            let thrd = 104067*Double(x)
            totalSouls = (first + scnd + thrd - 7E6)
        } else {
            let first = 1.65E-3*(pow(Double(x),3))
            let scnd = -0.695*pow(Double(x),2)
            let thrd = 832*Double(x)
            totalSouls = (first + scnd + thrd + 104885)
        }

        return totalSouls
    }
}

extension SoulsCalculatorViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
}

extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}
