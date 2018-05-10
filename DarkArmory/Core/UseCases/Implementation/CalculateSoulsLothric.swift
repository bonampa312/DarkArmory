//
//  CalculateSoulsLothric.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 4/16/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation


import Foundation

class CalculateSoulsLothric : UseCaseImplementation, CalculateSouls {
    
    func calculateSoulsForLevel(level x: Int) -> Double {
        
        let firstLevels : [Double] = [0,0,673,690,707,724,741,758,775,793,811,829,847,1039,1238,1445,1660,1883,2114,2353]
        if x < 20 && x > 0 {
            return firstLevels[x]
        }
        let first = 0.02*(pow(Double(x),3))
        let scnd = 3.06*pow(Double(x),2)
        let thrd = 105.6*Double(x)
        return (first + scnd + thrd - 895)
    }
    
    func calculateSoulsForRange (current : Int, target : Int) -> Int {
        var soulsTillTarget : Double = 0
        if current < target && current > 0 && target < 803 {
            for soulsForLevel in current+1...target {
                soulsTillTarget += self.calculateSoulsForLevel(level: soulsForLevel)
            }
        }
        let totalSouls = Int(soulsTillTarget.rounded())
        return totalSouls
    }
    
}
