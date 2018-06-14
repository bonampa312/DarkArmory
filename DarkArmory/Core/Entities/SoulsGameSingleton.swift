//
//  SoulsGameSingleton.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/10/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

class SoulsGame {
    
    public private(set) var game: SoulsSeriesGame
    
    public static let shared = SoulsGame()
    
    // Initialization
    private init() {
        game = .DarkSouls1
    }
    
    // MARK: - Setter
    func setGame(game gameParam : SoulsSeriesGame){
        game = gameParam
    }
}
