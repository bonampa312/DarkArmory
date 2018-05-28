//
//  ReusableCellIdentifierProtocol.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/28/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

protocol ReusableCellIdentifierProtocol { }

extension ReusableCellIdentifierProtocol where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
