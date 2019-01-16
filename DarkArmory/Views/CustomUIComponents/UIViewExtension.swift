//
//  UIViewExtension.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 10/30/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraintsToFillSuperview() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(0)-[subview]-(0)-|",
                                                                options: NSLayoutConstraint.FormatOptions(rawValue:0),
                                                                metrics: nil,
                                                                views: ["subview" : self]))
        self.superview?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-(0)-[subview]-(0)-|",
                                                                options: NSLayoutConstraint.FormatOptions(rawValue:0),
                                                                metrics: nil,
                                                                views: ["subview" : self]))
    }
}
