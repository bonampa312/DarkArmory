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
    @IBOutlet weak var imageActivityIndicator: UIActivityIndicatorView!
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
        
        intelligenceRequired.text = spell.requirements.intelligence.convertToString()
        faithRequired.text = spell.requirements.faith.convertToString()
        slots.text = spell.slots.convertToString()
        
        if (spell.uses != nil) {
            usesOrFP.text = "Uses"
            guard let uses = spell.uses else { return }
            usesOrFPValue.text = uses.convertToString()
        } else {
            usesOrFP.text = "FP"
            guard let focusPoints = spell.focusPoints else { return }
            usesOrFPValue.text = focusPoints.convertToString()
        }
        
        imageActivityIndicator.startAnimating()
        imageActivityIndicator.isHidden = false
        let imageURL = DarkArmoryAPIRouter.getImageResizedURL(url: spell.imageURL, size: 140)
        if (imageURL != nil) {
            guard let spellImageURL = imageURL else { return }
            spellImage.af_setImage(withURL: spellImageURL) { [weak self] (response) in
                guard let strongSelf = self else { return }
                strongSelf.imageActivityIndicator.stopAnimating()
                strongSelf.imageActivityIndicator.isHidden = true
                strongSelf.spellImage.alpha = 1
            }
        }  else {
            spellImage.image = UIImage(named: "spell_replenishment")
            imageActivityIndicator.stopAnimating()
            imageActivityIndicator.isHidden = true
            spellImage.alpha = 1
        }
    }

}
