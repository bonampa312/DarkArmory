//
//  MiscsTableViewCell.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/29/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit
import AlamofireImage

class MiscsTableViewCell: UITableViewCell, ReusableCellIdentifierProtocol {

    @IBOutlet weak var miscImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imageActivityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(misc: MiscShort){
        name.text = misc.name
        let imageURL = DarkArmoryAPIRouter.getImageResizedURL(url: misc.imageURL, size: 140)
        imageActivityIndicator.startAnimating()
        imageActivityIndicator.isHidden = false
        if (imageURL != nil) {
            guard let miscImageURL = imageURL else { return }
            miscImage.af_setImage(withURL: miscImageURL) { [weak self] (response) in
                guard let strongSelf = self else { return }
                strongSelf.imageActivityIndicator.stopAnimating()
                strongSelf.imageActivityIndicator.isHidden = true
                strongSelf.miscImage.alpha = 1
            }
        }  else {
            miscImage.image = UIImage(named: "soul")
            imageActivityIndicator.stopAnimating()
            imageActivityIndicator.isHidden = true
            miscImage.alpha = 1
        }
    }
    
}
