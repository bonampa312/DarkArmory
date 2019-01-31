//
//  RingDetailView.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 1/28/19.
//  Copyright © 2019 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

class RingDetailView: UIView {
    
    var element : RingDetail?
    
    @IBOutlet weak var ringDetailContentView: RingDetailView!
    
    // General data
    @IBOutlet weak var pictureImage: UIImageView!
    @IBOutlet weak var imageActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nameLabel: UILabel!
    // General stats
    @IBOutlet weak var weightLabel: UILabel!
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
    
    private func commonInit() {
        guard let ringView = Bundle.main.loadNibNamed("RingDetailView", owner: self, options: nil)?.first as? RingDetailView else { return }
        self.addSubview(ringView)
        ringView.addConstraintsToFillSuperview()
    }
    
    func configureUI() {
        
        guard let ring = self.element else { return }
        
        nameLabel.text = ring.name
        weightLabel.text = ring.weight.convertToString()
        descriptionLabel.text = ring.description
        
        var effectsText = ""
        for (index, location) in ring.effects.enumerated() {
            if (index != (ring.effects.count - 1)) {
                effectsText = effectsText + " - " + location + "\n"
            } else {
                effectsText = effectsText + " - " + location
            }
        }
        effectsLabel.text = effectsText
        
        var locationsText = ""
        for (index, location) in ring.locations.enumerated() {
            if (index != (ring.locations.count - 1)) {
                locationsText = locationsText + " - " + location + "\n"
            } else {
                locationsText = locationsText + " - " + location
            }
        }
        locationsLabel.text = locationsText
        
        imageActivityIndicator.startAnimating()
        imageActivityIndicator.isHidden = false
        
        let imageURL = DarkArmoryAPIRouter.getImageResizedURL(url: ring.imageURL)
        if (imageURL != nil) {
            guard let ringImageURL = imageURL else { return }
            pictureImage.af_setImage(withURL: ringImageURL) { [weak self] (response) in
                guard let strongSelf = self else { return }
                strongSelf.imageActivityIndicator.stopAnimating()
                strongSelf.imageActivityIndicator.isHidden = true
                strongSelf.pictureImage.alpha = 1
            }
        } else {
            pictureImage.image = UIImage(named: "ring_of_sacrifice")
            imageActivityIndicator.stopAnimating()
            imageActivityIndicator.isHidden = true
            pictureImage.alpha = 1
        }
    }
}
