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
    @IBOutlet weak var imageActivityIndicator: UIActivityIndicatorView!
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
        weight.text = armor.weight.convertToString()
        physicalDef.text = armor.defenses.physical.convertToString()
        magicDef.text = armor.defenses.magic.convertToString()
        fireDef.text = armor.defenses.fire.convertToString()
        lightningDef.text = armor.defenses.lightning.convertToString()
        if (armor.defenses.dark != nil) {
            guard let darkDefense = armor.defenses.dark else { return }
            darkDef.text = darkDefense.convertToString()
        } else {
            darkDefStack.isHidden = true
            emptyStack.isHidden = true
        }
        
        strikeDef.text = armor.physicalDefenses.strike.convertToString()
        thrustDef.text = armor.physicalDefenses.thrust.convertToString()
        slashDef.text = armor.physicalDefenses.slash.convertToString()
        type.image = UIImage(named: ArmorType.getArmorType(byId: armor.type))
        
        imageActivityIndicator.startAnimating()
        imageActivityIndicator.isHidden = false
        let imageURL = DarkArmoryAPIRouter.getImageResizedURL(url: armor.imageURL, size: 140)
        if (imageURL != nil) {
            guard let armorImageURL = imageURL else { return }
            armorImage.af_setImage(withURL: armorImageURL) { [weak self] (response) in
                guard let strongSelf = self else { return }
                strongSelf.imageActivityIndicator.stopAnimating()
                strongSelf.imageActivityIndicator.isHidden = true
                strongSelf.armorImage.alpha = 1
            }
        }  else {
            armorImage.image = UIImage(named: "sword")
            imageActivityIndicator.stopAnimating()
            imageActivityIndicator.isHidden = true
            armorImage.alpha = 1
        }
    }
}
