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
    @IBOutlet weak var imageActivityIndicator: UIActivityIndicatorView!
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
        weight.text = weapon.weight.convertToString()
        physicalDmg.text = weapon.baseDamage.physical.convertToString()
        magicDmg.text = weapon.baseDamage.magic.convertToString()
        fireDmg.text = weapon.baseDamage.fire.convertToString()
        lightningDmg.text = weapon.baseDamage.lightning.convertToString()
        if (weapon.baseDamage.dark != nil) {
            guard let darkDmgValue = weapon.baseDamage.dark else { return }
            darkDmg.text = darkDmgValue.convertToString()
        } else {
            darkDamageStack.isHidden = true
            emptyStackView.isHidden = true
        }
        strengthReq.text = weapon.requirements.strength.convertToString()
        dexterityReq.text = weapon.requirements.dexterity.convertToString()
        intelligenceReq.text = weapon.requirements.intelligence.convertToString()
        faithReq.text = weapon.requirements.faith.convertToString()
        
        imageActivityIndicator.startAnimating()
        imageActivityIndicator.isHidden = false
        let imageURL = DarkArmoryAPIRouter.getImageResizedURL(url: weapon.imageURL, size: 140)
        if (imageURL != nil) {
            guard let weaponImageURL = imageURL else { return }
            weaponImage.af_setImage(withURL: weaponImageURL) { [weak self] (response) in
                guard let strongSelf = self else { return }
                strongSelf.imageActivityIndicator.stopAnimating()
                strongSelf.imageActivityIndicator.isHidden = true
                strongSelf.weaponImage.alpha = 1
            }
        }  else {
            weaponImage.image = UIImage(named: "sword")
            imageActivityIndicator.stopAnimating()
            imageActivityIndicator.isHidden = true
            weaponImage.alpha = 1
        }
    }
}
