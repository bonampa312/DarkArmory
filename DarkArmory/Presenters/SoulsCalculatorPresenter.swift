//
//  SoulsCalculatorPresenter.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 4/13/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

protocol SoulsCalculatorView : class {
    func onUpdateSouls ()
    func showErrorEmptyFields ()
}

final class SoulsCalculatorPresenter {
    unowned fileprivate var view : SoulsCalculatorView
    var gameFromSeries : SoulsSeriesGame
    var soulsCalculator : CalculateSouls
    var totalSouls : String
    
    
    init(view : SoulsCalculatorView, game : SoulsSeriesGame) {
        self.view = view
        self.gameFromSeries = game
        self.totalSouls = ""
        switch gameFromSeries {
            case .DarkSouls1, .DarkSouls3 :
                soulsCalculator = CalculateSoulsLordranAndLothric()
            case .DarkSouls2 :
                soulsCalculator = CalculateSoulsDrangleic()
        }
    }
    
    func calculateTotalSouls (startLevel : String?, targetLevel : String?) {
        if let current = Int(startLevel!), let target = Int(targetLevel!) {
            var soulsTillTarget : Double = 0
            if current < target {
                for soulsForLevel in current+1...target {
                    soulsTillTarget += self.soulsCalculator.calculateSoulsForLevel(level: soulsForLevel)
                }
            }
            self.totalSouls = Int(soulsTillTarget.rounded()).withCommas()
            self.view.onUpdateSouls()
        } else {
            self.view.showErrorEmptyFields()
        }
    }
    
}

