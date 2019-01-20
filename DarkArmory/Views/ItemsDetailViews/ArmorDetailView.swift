//
//  ArmorDetailView.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 10/26/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

class ArmorDetailView: UIView {
    
    var element : ArmorDetail?
    
    @IBOutlet var armorDetailContentView: ArmorDetailView!
    
    //MARK: - Armor UI outlets
    // General data
    @IBOutlet weak var pictureImage: UIImageView!
    @IBOutlet weak var imageActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var typeImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var poiseLabel: UILabel!
    // Requeriments
    @IBOutlet weak var requirementsStack: UIStackView!
    @IBOutlet weak var strengthLabel: UILabel!
    @IBOutlet weak var dexterityLabel: UILabel!
    @IBOutlet weak var intelligenceLabel: UILabel!
    @IBOutlet weak var faithLabel: UILabel!
    // Physical defenses
    @IBOutlet weak var physicalDefLabel: UILabel!
    @IBOutlet weak var strikeDefLabel: UILabel!
    @IBOutlet weak var thrustDefLabel: UILabel!
    @IBOutlet weak var slashDefLabel: UILabel!
    // Elemental defenses
    @IBOutlet weak var magicDefLabel: UILabel!
    @IBOutlet weak var lightningDefLabel: UILabel!
    @IBOutlet weak var fireDefLabel: UILabel!
    @IBOutlet weak var darkDefLabel: UILabel!
    @IBOutlet weak var optionalElemDefStack: UIStackView!
    // Resistances
    @IBOutlet weak var bleedResLabel: UILabel!
    @IBOutlet weak var poisonResLabel: UILabel!
    @IBOutlet weak var curseResLabel: UILabel!
    @IBOutlet weak var optionalResistanceStack: UIStackView!
    @IBOutlet weak var optionalResistanceImage: UIImageView!
    @IBOutlet weak var optionalResLabel: UILabel!
    // Specific data
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationsLabel: UILabel!
    // Optional data
    @IBOutlet weak var effectsStack: UIStackView!
    @IBOutlet weak var effectsLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func commonInit() {
        guard let armorView = Bundle.main.loadNibNamed("ArmorDetailView", owner: self, options: nil)?.first as? ArmorDetailView else { return }
        self.addSubview(armorView)
        armorView.addConstraintsToFillSuperview()
    }
    
    func configureUI() {
        guard let armor = self.element else {
            return
        }
        nameLabel.text = armor.name
        weightLabel.text = armor.weight.convertToString()
        poiseLabel.text = armor.poise.convertToString()
        
        
        if (armor.requirements != nil) {
            requirementsStack.isHidden = false
            guard let requirements = armor.requirements else { return }
            strengthLabel.text = requirements.strength.convertToString()
            dexterityLabel.text = requirements.dexterity.convertToString()
            intelligenceLabel.text = requirements.intelligence.convertToString()
            faithLabel.text = requirements.faith.convertToString()
            requirementsStack.isHidden = false
        } else {
            requirementsStack.isHidden = true
        }
        
        physicalDefLabel.text = armor.defenses.physical.convertToString()
        slashDefLabel.text = armor.physicalDefenses.slash.convertToString()
        strikeDefLabel.text = armor.physicalDefenses.strike.convertToString()
        thrustDefLabel.text = armor.physicalDefenses.thrust.convertToString()
        
        magicDefLabel.text = armor.defenses.magic.convertToString()
        fireDefLabel.text = armor.defenses.fire.convertToString()
        lightningDefLabel.text = armor.defenses.lightning.convertToString()
        if (armor.defenses.dark != nil) {
            guard let darkDef = armor.defenses.dark else { return }
            darkDefLabel.text = darkDef.convertToString()
            optionalElemDefStack.isHidden = false
        } else {
            optionalElemDefStack.isHidden = true
        }
        
        bleedResLabel.text = armor.resistances.bleed.convertToString()
        poisonResLabel.text = armor.resistances.poison.convertToString()
        guard let curseResistance = armor.resistances.curse else { return }
        curseResLabel.text = curseResistance.convertToString()
        if (armor.resistances.frost != nil) {
            guard let frostResistance = armor.resistances.frost else { return }
            optionalResLabel.text = frostResistance.convertToString()
            optionalResistanceImage.image = UIImage(named: "frostDefense")
            optionalResistanceStack.isHidden = false
        } else if (armor.resistances.petrification != nil) {
            guard let petrificationResistance = armor.resistances.petrification else { return }
            optionalResLabel.text = petrificationResistance.convertToString()
            optionalResistanceImage.image = UIImage(named: "petrifyDefense")
            optionalResistanceStack.isHidden = false
        } else {
            optionalResistanceStack.isHidden = true
        }
        
        descriptionLabel.text = armor.description
        var locationsText = ""
        for (index, location) in armor.locations.enumerated() {
            if (index != (armor.locations.count - 1)) {
                locationsText = locationsText + " - " + location + "\n"
            } else {
                locationsText = locationsText + " - " + location
            }
        }
        locationsLabel.text = locationsText
        
        if armor.effects != nil {
            var effectsText = ""
            guard let effects = armor.effects else { return }
            for effect in effects {
                effectsText = effectsText + " - " + effect
            }
            effectsLabel.text = effectsText
            effectsStack.isHidden = false
        } else {
            effectsStack.isHidden = true
        }
        
        self.imageActivityIndicator.startAnimating()
        self.imageActivityIndicator.isHidden = false
        
        typeImage.image = UIImage(named: ArmorType.getArmorType(byId: armor.type))
        let imageURL = DarkArmoryAPIRouter.getImageResizedURL(url: armor.imageURL)
        if (imageURL != nil) {
            guard let armorImageURL = imageURL else { return }
            pictureImage.af_setImage(withURL: armorImageURL) { response in
                self.imageActivityIndicator.stopAnimating()
                self.imageActivityIndicator.isHidden = true
            }
        }  else {
            pictureImage.image = UIImage(named: "armor")
            self.imageActivityIndicator.stopAnimating()
            self.imageActivityIndicator.isHidden = true
        }
        pictureImage.alpha = 1
    }
}
