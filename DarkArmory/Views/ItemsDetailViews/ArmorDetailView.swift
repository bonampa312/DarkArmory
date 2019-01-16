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
        weightLabel.text = String(format: "%.0f", armor.weight)
        poiseLabel.text = String(format: "%.0f", armor.poise)
        
        
        if (armor.requirements != nil) {
            requirementsStack.isHidden = false
            guard let requirements = armor.requirements else { return }
            strengthLabel.text = String(requirements.strength)
            dexterityLabel.text = String(requirements.dexterity)
            intelligenceLabel.text = String(requirements.intelligence)
            faithLabel.text = String(requirements.faith)
        } else {
            requirementsStack.isHidden = true
        }
        
        physicalDefLabel.text = String(format: "%.0f", armor.defenses.physical)
        slashDefLabel.text = String(format: "%.0f", armor.physicalDefenses.slash)
        strikeDefLabel.text = String(format: "%.0f", armor.physicalDefenses.strike)
        thrustDefLabel.text = String(format: "%.0f", armor.physicalDefenses.thrust)
        
        magicDefLabel.text = String(format: "%.0f", armor.defenses.magic)
        fireDefLabel.text = String(format: "%.0f", armor.defenses.fire)
        lightningDefLabel.text = String(format: "%.0f", armor.defenses.lightning)
        if (armor.defenses.dark != nil) {
            darkDefLabel.text = String(format: "%.0f", armor.defenses.dark!)
        } else {
            optionalElemDefStack.isHidden = true
        }
        
        bleedResLabel.text = String(armor.resistances.bleed)
        poisonResLabel.text = String(armor.resistances.poison)
        curseResLabel.text = String(armor.resistances.curse!)
        if (armor.resistances.frost != nil) {
            optionalResLabel.text = String(armor.resistances.frost!)
            optionalResistanceImage.image = UIImage(named: "frostDefense")
            optionalResistanceStack.isHidden = false
        } else if (armor.resistances.petrification != nil) {
            optionalResLabel.text = String(armor.resistances.petrification!)
            optionalResistanceImage.image = UIImage(named: "petrifyDefense")
            optionalResistanceStack.isHidden = false
        } else {
            optionalResistanceStack.isHidden = true
        }
        
        descriptionLabel.text = armor.description
        var locationsText = ""
        for location in armor.locations {
            locationsText = locationsText + " - " + location + "\n"
        }
        locationsLabel.text = locationsText
        
        if armor.effects != nil {
            var effectsText = ""
            for effect in armor.effects! {
                effectsText = effectsText + " - " + effect
            }
            effectsLabel.text = effectsText
            effectsStack.isHidden = false
        } else {
            effectsStack.isHidden = true
        }
        
        typeImage.image = UIImage(named: ArmorType.getArmorType(byId: armor.type))
        let imageURL = DarkArmoryAPIRouter.getImageResizedURL(url: armor.imageURL)
        if (imageURL != nil) {
            pictureImage.af_setImage(withURL: imageURL!)
        }  else {
            pictureImage.image = UIImage(named: "armor")
        }
    }
}
