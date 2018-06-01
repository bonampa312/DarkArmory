//
//  ArmorsTableViewCell.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 6/1/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

class ArmorsTableViewCell: UITableViewCell, ReusableCellIdentifierProtocol {

    @IBOutlet weak var armorImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var physicalDef: UILabel!
    @IBOutlet weak var magicDef: UILabel!
    @IBOutlet weak var fireDef: UILabel!
    @IBOutlet weak var lightningDef: UILabel!
    @IBOutlet weak var darkDef: UILabel!
    @IBOutlet weak var darkDefStack: UIStackView!
    @IBOutlet weak var emptyStack: UIStackView!
    @IBOutlet weak var strikeDef: UILabel!
    @IBOutlet weak var thrustDef: UILabel!
    @IBOutlet weak var slashDef: UILabel!
    @IBOutlet weak var type: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(armor: ArmorsShort){
        name.text = armor.name
        weight.text = String(format: "%.0f", armor.weight)
        physicalDef.text = String(format: "%.0f", armor.defenses.physical)
        magicDef.text = String(format: "%.0f", armor.defenses.magic)
        fireDef.text = String(format: "%.0f", armor.defenses.fire)
        lightningDef.text = String(format: "%.0f", armor.defenses.lightning)
        if (armor.defenses.dark != nil) {
            darkDef.text = String(format: "%.0f", armor.defenses.dark!)
        } else {
            darkDefStack.isHidden = true
            emptyStack.isHidden = true
        }
        strikeDef.text = String(format: "%.0f", armor.physicalDefenses.strike)
        thrustDef.text = String(format: "%.0f", armor.physicalDefenses.thrust)
        slashDef.text = String(format: "%.0f", armor.physicalDefenses.slash)
        type.image = UIImage(named: ArmorType.getArmorType(byId: armor.type))
        
        let imageURL = DarkArmoryAPIRouter.getImageResizedURL(url: armor.imageURL, size: 140)
        if (imageURL != nil) {
            armorImage.af_setImage(withURL: imageURL!)
        }  else {
            armorImage.image = UIImage(named: "sword")
        }
    }
}
