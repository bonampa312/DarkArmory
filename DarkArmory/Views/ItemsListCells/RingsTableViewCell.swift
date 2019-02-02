//
//  RingsTableViewCell.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/28/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit
import AlamofireImage

class RingsTableViewCell: UITableViewCell, ReusableCellIdentifierProtocol {
    
    @IBOutlet weak var ringImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var weightStack: UIStackView!
    @IBOutlet weak var imageActivityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(ring: RingShort) {
        self.name.text = ring.name
        if ring.weight > 0 {
            self.weight.text = ring.weight.convertToString()
        } else {
            weightStack.isHidden = true
        }
        
        let imageURL = DarkArmoryAPIRouter.getImageResizedURL(url: ring.imageURL, size: 140)
        imageActivityIndicator.isHidden = false
        imageActivityIndicator.startAnimating()
        if (imageURL != nil) {
            guard let ringImageURL = imageURL else { return }
            ringImage.af_setImage(withURL: ringImageURL) { [weak self] (response) in
                guard let strongSelf = self else { return }
                strongSelf.imageActivityIndicator.stopAnimating()
                strongSelf.imageActivityIndicator.isHidden = true
                strongSelf.ringImage.alpha = 1
            }
        }  else {
            ringImage.image = UIImage(named: "ring_of_sacrifice")
            imageActivityIndicator.stopAnimating()
            imageActivityIndicator.isHidden = true
            ringImage.alpha = 1
        }
    }
    
}
