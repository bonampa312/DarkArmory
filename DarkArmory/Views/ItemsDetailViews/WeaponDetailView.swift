//
//  WeaponDetailView.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 10/26/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

class WeaponDetailView: UIView {

    @IBOutlet var weaponDetailContentView: UIView!
    @IBOutlet weak var testText: UILabel!
    
    var element : WeaponDetail?
    
    var testTextStr: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //TODO Change here
        if testTextStr == nil {
            testTextStr = "This is another test for weapon text"
        }
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("WeaponDetailView", owner: self, options: nil)
        addSubview(weaponDetailContentView)
        weaponDetailContentView.frame = self.bounds
        weaponDetailContentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func configureUI() {
        guard let _ = self.element else {
            return
        }
        //TODO Fill this with weapon stuff
        self.testText.text = self.element?.description
    }

}
