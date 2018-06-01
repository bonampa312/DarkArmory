//
//  WeaponsTableViewCell.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/28/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit
import AlamofireImage

class WeaponsTableViewCell: UITableViewCell, ReusableCellIdentifierProtocol {

    @IBOutlet weak var physicalDmg: UILabel!
    @IBOutlet weak var magicDmg: UILabel!
    @IBOutlet weak var fireDmg: UILabel!
    @IBOutlet weak var lightningDmg: UILabel!
    @IBOutlet weak var darkDmg: UILabel!
    @IBOutlet weak var weaponImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var strengthReq: UILabel!
    @IBOutlet weak var dexterityReq: UILabel!
    @IBOutlet weak var intelligenceReq: UILabel!
    @IBOutlet weak var faithReq: UILabel!
    @IBOutlet weak var darkDamageStack: UIStackView!
    @IBOutlet weak var emptyStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(weapon: WeaponShort) {
        name.text = weapon.name
        weight.text = String(weapon.weight)
        physicalDmg.text = String(format: "%.0f", weapon.baseDamage.physical)
        magicDmg.text = String(format: "%.0f", weapon.baseDamage.magic)
        fireDmg.text = String(format: "%.0f", weapon.baseDamage.fire)
        lightningDmg.text = String(format: "%.0f", weapon.baseDamage.lightning)
        if (weapon.baseDamage.dark != nil) {
            darkDmg.text = String(format: "%.0f", weapon.baseDamage.dark!)
        } else {
            darkDamageStack.isHidden = true
            emptyStackView.isHidden = true
        }
        strengthReq.text = String(weapon.requirements.strength)
        dexterityReq.text = String(weapon.requirements.dexterity)
        intelligenceReq.text = String(weapon.requirements.intelligence)
        faithReq.text = String(weapon.requirements.faith)
        
        let imageURL = DarkArmoryAPIRouter.getImageResizedURL(url: weapon.imageURL, size: 140)
        if (imageURL != nil) {
            weaponImage.af_setImage(withURL: imageURL!)
        }  else {
            weaponImage.image = UIImage(named: "sword")
        }
    }
}
