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
    func showErrorOutOfRangeLevels()
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
        case .DarkSouls1 :
            soulsCalculator = CalculateSoulsLordran()
        case .DarkSouls2 :
            soulsCalculator = CalculateSoulsDrangleic()
        case .DarkSouls3 :
            soulsCalculator = CalculateSoulsLothric()
        }
    }
    
    func calculateTotalSouls (startLevel : String?, targetLevel : String?) {
        if let current = Int(startLevel!), let target = Int(targetLevel!) {
            self.totalSouls = self.soulsCalculator.calculateSoulsForRange(current: current, target: target).withCommas()
            if self.totalSouls == "0" && current != target {
                self.view.showErrorOutOfRangeLevels()
            } else {
                self.view.onUpdateSouls()
            }
        } else {
            self.view.showErrorEmptyFields()
        }
    }
    
}

