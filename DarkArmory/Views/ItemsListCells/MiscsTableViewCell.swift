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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(misc: MiscShort){
        name.text = misc.name
        let imageURL = DarkArmoryAPIRouter.getImageResizedURL(url: misc.imageURL, size: 140)
        if (imageURL != nil) {
            miscImage.af_setImage(withURL: imageURL!)
        }  else {
            miscImage.image = UIImage(named: "soul")
        }
    }
    
}
