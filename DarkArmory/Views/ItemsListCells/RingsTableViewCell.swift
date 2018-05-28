//
//  RingsTableViewCell.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/28/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

class RingsTableViewCell: UITableViewCell, ReusableCellIdentifierProtocol {
    
    @IBOutlet weak var ringImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var weightStack: UIStackView!
    
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
            self.weight.text = String(ring.weight)
        } else {
            weightStack.isHidden = true
        }
    }
    
}
