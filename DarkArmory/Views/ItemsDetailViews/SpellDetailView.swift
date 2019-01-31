//
//  SpellDetailView.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 1/27/19.
//  Copyright © 2019 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

class SpellDetailView : UIView {
    
    var element : SpellDetail?
    
    @IBOutlet weak var spellDetailContentView: SpellDetailView!
    
    // General data
    @IBOutlet weak var pictureImage: UIImageView!
    @IBOutlet weak var imageActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var spellTypeLabel: UILabel!
    // General stats
    @IBOutlet weak var slotsLabel: UILabel!
    @IBOutlet weak var consumptionLabel: UILabel!
    // Requeriments
    @IBOutlet weak var strengthReqLabel: UILabel!
    @IBOutlet weak var dexterityReqLabel: UILabel!
    @IBOutlet weak var intelligenceReqLabel: UILabel!
    @IBOutlet weak var faithReqLabel: UILabel!
    // Specific data
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationsLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func commonInit() {
        guard let spellView = Bundle.main.loadNibNamed("SpellDetailView", owner: self, options: nil)?.first as? SpellDetailView else { return }
        self.addSubview(spellView)
        spellView.addConstraintsToFillSuperview()
    }
    
    func configureUI() {
        guard let spell = self.element else { return }
        
        nameLabel.text = spell.name
        spellTypeLabel.text = spell.spellType.name
        slotsLabel.text = spell.slots.convertToString()
        
        if (spell.focusPoints != nil) {
            consumptionLabel.text = spell.focusPoints?.convertToString()
        } else if (spell.uses != nil) {
            consumptionLabel.text = spell.uses?.convertToString()
        }
        
        strengthReqLabel.text = spell.requirements.strength.convertToString()
        dexterityReqLabel.text = spell.requirements.dexterity.convertToString()
        intelligenceReqLabel.text = spell.requirements.intelligence.convertToString()
        faithReqLabel.text = spell.requirements.faith.convertToString()
        
        descriptionLabel.text = spell.description
        
        var locationsText = ""
        for (index, location) in spell.locations.enumerated() {
            if (index != (spell.locations.count - 1)) {
                locationsText = locationsText + " - " + location + "\n"
            } else {
                locationsText = locationsText + " - " + location
            }
        }
        locationsLabel.text = locationsText
        
        
        imageActivityIndicator.startAnimating()
        imageActivityIndicator.isHidden = false
        
        let imageURL = DarkArmoryAPIRouter.getImageResizedURL(url: spell.imageURL)
        if (imageURL != nil) {
            guard let spellImageURL = imageURL else { return }
            pictureImage.af_setImage(withURL: spellImageURL) { [weak self] (response) in
                guard let strongSelf = self else { return }
                strongSelf.imageActivityIndicator.stopAnimating()
                strongSelf.imageActivityIndicator.isHidden = true
                strongSelf.pictureImage.alpha = 1
            }
        } else {
            pictureImage.image = UIImage(named: "spell_replenishment")
            imageActivityIndicator.stopAnimating()
            imageActivityIndicator.isHidden = true
            pictureImage.alpha = 1
        }
    }
    
}
