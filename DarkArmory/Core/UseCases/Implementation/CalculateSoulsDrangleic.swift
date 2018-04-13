//
//  CalculateSoulsDrangleic.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 4/11/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

class CalculateSoulsDrangleic : CalculateSouls {
    
    func calculateSoulsForLevel(level x: Int) -> Double {
    
        var totalSouls = 0.0
        
        if x <= 170 {
            let first = 0.0000537*(pow(Double(x),4))
            let scnd = -0.0144*(pow(Double(x),3))
            let thrd = 2.33*pow(Double(x),2)
            let frth = -12.5*Double(x)
            totalSouls = (first + scnd + thrd + frth + 686)
        } else if x <= 180  {
            let first = 3.065*pow(Double(x),2)
            let scnd = -557*Double(x)
            totalSouls = (first + scnd + 46865)
        } else if x <= 200 {
            let first = 1.56*pow(Double(x),2)
            let scnd = -201*Double(x)
            totalSouls = (first + scnd + 30951)
        } else if x <= 250 {
            let first = 0.889*(pow(Double(x),3))
            let scnd = -522*pow(Double(x),2)
            let thrd = 104067*Double(x)
            totalSouls = (first + scnd + thrd - 7E6)
        } else {
            let first = 1.65E-3*(pow(Double(x),3))
            let scnd = -0.695*pow(Double(x),2)
            let thrd = 832*Double(x)
            totalSouls = (first + scnd + thrd + 104885)
        }
        
        return totalSouls
    }
    
}
