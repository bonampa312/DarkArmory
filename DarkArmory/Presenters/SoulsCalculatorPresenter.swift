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
    
    // MARK: - View that implements presenter
    unowned fileprivate var view : SoulsCalculatorView
    
    var soulsCalculator : CalculateSouls
    var locator : UseCaseLocatorProtocol
    var totalSouls : String
    
    var gameFromSeries : SoulsSeriesGame {
        didSet {
            guard let soulsCalculatorLocator = self.locator.getUseCase(ofType: CalculateSouls.self) else { return }
            self.soulsCalculator = soulsCalculatorLocator
        }
    }
    
    init(view : SoulsCalculatorView, locator : UseCaseLocatorProtocol) {
        self.view = view
        self.soulsCalculator = CalculateSoulsLordran()
        self.gameFromSeries = SoulsGameSingleton.getGlobalGame()
        self.totalSouls = ""
        self.locator = locator
    }
    
    func initGameFromSeries() {
        self.gameFromSeries = SoulsGameSingleton.getGlobalGame()
    }
    
    func calculateTotalSouls (startLevel : String?, targetLevel : String?) {
        if startLevel != nil, targetLevel != nil {
            guard let current = Int(startLevel!), let target = Int(targetLevel!) else { return }
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

