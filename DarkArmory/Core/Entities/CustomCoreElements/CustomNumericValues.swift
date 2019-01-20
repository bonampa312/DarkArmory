//
//  CustomInteger.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 4/13/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
    
    func convertToString() -> String {
        return String(self)
    }
}

extension Float {
    func convertToString() -> String {
        return self.truncatingRemainder(dividingBy: 1.0) == 0.0 ? String(Int(self)) : String(self)
    }
}
