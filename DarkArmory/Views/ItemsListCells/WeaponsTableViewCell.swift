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
        physicalDmg.text = String(weapon.baseDamage.physical)
        magicDmg.text = String(weapon.baseDamage.magic)
        fireDmg.text = String(weapon.baseDamage.fire)
        lightningDmg.text = String(weapon.baseDamage.lightning)
        if (weapon.baseDamage.dark != nil) {
            darkDmg.text = String(weapon.baseDamage.dark!)
        } else {
            darkDamageStack.isHidden = true
            emptyStackView.isHidden = true
        }
        strengthReq.text = String(weapon.requeriments.strength)
        dexterityReq.text = String(weapon.requeriments.dexterity)
        intelligenceReq.text = String(weapon.requeriments.intelligence)
        faithReq.text = String(weapon.requeriments.faith)
        
        let imageURL = URL(string: weapon.imageURL)
        if (imageURL != nil) {
            weaponImage.af_setImage(withURL: imageURL!)
        }  else {
            weaponImage.image = UIImage(named: "sword")
        }
    }
}
