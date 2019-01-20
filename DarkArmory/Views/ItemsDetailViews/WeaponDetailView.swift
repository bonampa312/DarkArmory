//
//  WeaponDetailView.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 10/26/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

class WeaponDetailView: UIView {
    
    var element : WeaponDetail?

    @IBOutlet weak var weaponDetailContentView: WeaponDetailView!
    
    //MARK: - Weapon UI outlets
    // General data
    @IBOutlet weak var pictureImage: UIImageView!
    @IBOutlet weak var imageActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var attackTypeLabel: UILabel!
    // General stats
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var stabilityLabel: UILabel!
    @IBOutlet weak var criticalLabel: UILabel!
    // Magic adjust
    @IBOutlet weak var magicAdjustStack: UIStackView!
    @IBOutlet weak var magicAdjustLabel: UILabel!
    // Range
    @IBOutlet weak var rangeView: UICustomView!
    @IBOutlet weak var rangeValueLabel: UILabel!
    // Base damage
    @IBOutlet weak var physicalDmgLabel: UILabel!
    @IBOutlet weak var magicDmgLabel: UILabel!
    @IBOutlet weak var lightningDmgLabel: UILabel!
    @IBOutlet weak var fireDmgLabel: UILabel!
    @IBOutlet weak var darkDmgStack: UIStackView!
    @IBOutlet weak var darkDmgLabel: UILabel!
    // Requeriments
    @IBOutlet weak var strengthReqLabel: UILabel!
    @IBOutlet weak var dexterityReqLabel: UILabel!
    @IBOutlet weak var intelligenceReqLabel: UILabel!
    @IBOutlet weak var faithReqLabel: UILabel!
    // Bonuses
    @IBOutlet weak var strengthBonusLabel: UILabel!
    @IBOutlet weak var dexterityBonusLabel: UILabel!
    @IBOutlet weak var intelligenceBonusLabel: UILabel!
    @IBOutlet weak var faithBonusLabel: UILabel!
    // Aditional damage
    @IBOutlet weak var aditionalDmgStack: UIStackView!
    @IBOutlet weak var bleedLabel: UILabel!
    @IBOutlet weak var poisonLabel: UILabel!
    @IBOutlet weak var frostLabel: UILabel!
    // Defenses
    @IBOutlet weak var physicalDefLabel: UILabel!
    @IBOutlet weak var magicDefLabel: UILabel!
    @IBOutlet weak var lightningDefLabel: UILabel!
    @IBOutlet weak var fireDefLabel: UILabel!
    @IBOutlet weak var darkDefStack: UIStackView!
    @IBOutlet weak var darkDefLabel: UILabel!
    // Specific data
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationsLabel: UILabel!
    // Weapon Skill
    @IBOutlet weak var skillStack: UIStackView!
    @IBOutlet weak var skillTitleLabel: UILabel!
    @IBOutlet weak var skillLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func commonInit() {
        guard let weaponView = Bundle.main.loadNibNamed("WeaponDetailView", owner: self, options: nil)?.first as? WeaponDetailView else { return }
        self.addSubview(weaponView)
        weaponView.addConstraintsToFillSuperview()
    }
    
    func configureUI() {
        guard let weapon = self.element else { return }
        
        if (weapon.range != nil) {
            guard let weaponRange = weapon.range else { return }
            rangeValueLabel.text = weaponRange.convertToString()
            rangeView.isHidden = false
        } else {
            rangeView.isHidden = true
        }
        
        nameLabel.text = weapon.name
        typeLabel.text = weapon.weaponType
        attackTypeLabel.text = weapon.attackType
        
        weightLabel.text = weapon.weight.convertToString()
        stabilityLabel.text = weapon.stability.convertToString()
        criticalLabel.text = weapon.critical.convertToString()
        
        if (weapon.baseDamage.magicalAdjust != nil) {
            guard let magicAdjust = weapon.baseDamage.magicalAdjust else { return }
            magicAdjustLabel.text = magicAdjust.convertToString()
            magicAdjustStack.isHidden = false
        } else {
            magicAdjustStack.isHidden = true
        }
        
        physicalDmgLabel.text = weapon.baseDamage.physical.convertToString()
        fireDmgLabel.text = weapon.baseDamage.fire.convertToString()
        magicDmgLabel.text = weapon.baseDamage.magic.convertToString()
        lightningDmgLabel.text = weapon.baseDamage.lightning.convertToString()
        
        if (weapon.baseDamage.dark != nil) {
            guard let darkDmg = weapon.baseDamage.dark else { return }
            darkDmgLabel.text = darkDmg.convertToString()
            darkDmgStack.isHidden = false
        } else {
            darkDmgStack.isHidden = true
        }
        
        strengthReqLabel.text = weapon.requirements.strength.convertToString()
        dexterityReqLabel.text = weapon.requirements.dexterity.convertToString()
        intelligenceReqLabel.text = weapon.requirements.intelligence.convertToString()
        faithReqLabel.text = weapon.requirements.faith.convertToString()
        
        strengthBonusLabel.text = weapon.bonuses.strength
        dexterityBonusLabel.text = weapon.bonuses.dexterity
        intelligenceBonusLabel.text = weapon.bonuses.intelligence
        faithBonusLabel.text = weapon.bonuses.faith
        
        if (weapon.aditionalDamage != nil) {
            guard let aditionalDmg = weapon.aditionalDamage else { return }
            bleedLabel.text = aditionalDmg.bleed.convertToString()
            poisonLabel.text = aditionalDmg.poison.convertToString()
            guard let frostDmg = aditionalDmg.frost else { return }
            frostLabel.text = frostDmg.convertToString()
            aditionalDmgStack.isHidden = false
        } else {
            aditionalDmgStack.isHidden = true
        }
        
        physicalDefLabel.text = weapon.defenses.physical.convertToString()
        fireDefLabel.text = weapon.defenses.fire.convertToString()
        magicDefLabel.text = weapon.defenses.magic.convertToString()
        lightningDefLabel.text = weapon.defenses.lightning.convertToString()
        
        if (weapon.defenses.dark != nil) {
            guard let darkDef = weapon.defenses.dark else { return }
            darkDefLabel.text = darkDef.convertToString()
            darkDefStack.isHidden = false
        } else {
            darkDefStack.isHidden = true
        }
        
        descriptionLabel.text = weapon.description
        
        if (weapon.skill != nil) {
            guard let skill = weapon.skill else { return }
            skillTitleLabel.text = skill.name
            skillLabel.text = skill.description
            skillStack.isHidden = false
        } else {
            skillStack.isHidden = true
        }
        
        var locationsText = ""
        for (index, location) in weapon.locations.enumerated() {
            if (index != (weapon.locations.count - 1)) {
                locationsText = locationsText + " - " + location + "\n"
            } else {
                locationsText = locationsText + " - " + location
            }
        }
        locationsLabel.text = locationsText
        
        imageActivityIndicator.startAnimating()
        imageActivityIndicator.isHidden = false
        
        let imageURL = DarkArmoryAPIRouter.getImageResizedURL(url: weapon.imageURL)
        if (imageURL != nil) {
            guard let weaponImageURL = imageURL else { return }
            pictureImage.af_setImage(withURL: weaponImageURL) { response in
                self.imageActivityIndicator.stopAnimating()
                self.imageActivityIndicator.isHidden = true
            }
        } else {
            pictureImage.image = UIImage(named: "sword")
            imageActivityIndicator.stopAnimating()
            imageActivityIndicator.isHidden = true
        }
        pictureImage.alpha = 1
        
    }

}
