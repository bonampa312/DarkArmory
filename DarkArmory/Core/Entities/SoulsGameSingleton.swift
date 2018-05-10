//
//  SoulsGameSingleton.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/10/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

class SoulsGameSingleton {
    
    private var game: SoulsSeriesGame
    private static var soulsGame : SoulsGameSingleton?
    
    // Initialization
    private init(game: SoulsSeriesGame) {
        self.game = game
    }
    
    // MARK: - Setter
    static func setGame(game gameParam : SoulsSeriesGame){
        if let gameExists = soulsGame {
            gameExists.game = gameParam
        } else {
            soulsGame = SoulsGameSingleton(game: gameParam)
        }
    }
    
    // MARK: - Accessor
    static func getGlobalGame() -> SoulsSeriesGame {
        if let gameExists = soulsGame {
            return gameExists.game
        } else {
            soulsGame = SoulsGameSingleton(game: .DarkSouls1)
            return soulsGame!.game
        }
    }
}
