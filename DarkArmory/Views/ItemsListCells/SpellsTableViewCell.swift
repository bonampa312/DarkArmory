//
//  SpellsTableViewCell.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/30/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit
import AlamofireImage

class SpellsTableViewCell: UITableViewCell, ReusableCellIdentifierProtocol {

    @IBOutlet weak var spellImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var intelligenceRequired: UILabel!
    @IBOutlet weak var faithRequired: UILabel!
    @IBOutlet weak var slots: UILabel!
    @IBOutlet weak var usesOrFP: UILabel!
    @IBOutlet weak var usesOrFPValue: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(spell: SpellShort) {
        name.text = spell.name
        type.text = spell.spellType.name
        intelligenceRequired.text = String(spell.requirements.intelligence)
        faithRequired.text = String(spell.requirements.faith)
        slots.text = String(spell.slots)
        if (spell.uses != nil) {
            usesOrFP.text = "Uses"
            usesOrFPValue.text = String(spell.uses!)
        } else {
            usesOrFP.text = "FP"
            usesOrFPValue.text = String(spell.focusPoints!)
        }
        let imageURL = DarkArmoryAPIRouter.getImageResizedURL(url: spell.imageURL, size: 140)
        if (imageURL != nil) {
            spellImage.af_setImage(withURL: imageURL!)
        }  else {
            spellImage.image = UIImage(named: "spell_replenishment")
        }
    }

}
