//
//  MiscDetailView.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 1/29/19.
//  Copyright © 2019 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

class MiscDetailView: UIView {
    
    var element : MiscDetail?
    
    @IBOutlet var miscDetailContentView: MiscDetailView!
    
    // General data
    @IBOutlet weak var pictureImage: UIImageView!
    @IBOutlet weak var imageActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nameLabel: UILabel!
    // Specific data
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationsLabel: UILabel!
    @IBOutlet weak var effectsLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func commonInit() {
        guard let miscView = Bundle.main.loadNibNamed("MiscDetailView", owner: self, options: nil)?.first as? MiscDetailView else { return }
        self.addSubview(miscView)
        miscView.addConstraintsToFillSuperview()
    }
    
    func configureUI() {
        guard let misc = self.element else { return }
        
        nameLabel.text = misc.name
        descriptionLabel.text = misc.description
        
        var effectsText = ""
        for (index, location) in misc.effects.enumerated() {
            if (index != (misc.effects.count - 1)) {
                effectsText = effectsText + " - " + location + "\n"
            } else {
                effectsText = effectsText + " - " + location
            }
        }
        effectsLabel.text = effectsText
        
        var locationsText = ""
        for (index, location) in misc.locations.enumerated() {
            if (index != (misc.locations.count - 1)) {
                locationsText = locationsText + " - " + location + "\n"
            } else {
                locationsText = locationsText + " - " + location
            }
        }
        locationsLabel.text = locationsText
        
        imageActivityIndicator.startAnimating()
        imageActivityIndicator.isHidden = false
        
        let imageURL = DarkArmoryAPIRouter.getImageResizedURL(url: misc.imageURL)
        if (imageURL != nil) {
            guard let miscImageURL = imageURL else { return }
            pictureImage.af_setImage(withURL: miscImageURL) { [weak self] (response) in
                guard let strongSelf = self else { return }
                strongSelf.imageActivityIndicator.stopAnimating()
                strongSelf.imageActivityIndicator.isHidden = true
                strongSelf.pictureImage.alpha = 1
            }
        } else {
            pictureImage.image = UIImage(named: "soul")
            imageActivityIndicator.stopAnimating()
            imageActivityIndicator.isHidden = true
            pictureImage.alpha = 1
        }
    }
    
}
