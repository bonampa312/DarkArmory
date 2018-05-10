//
//  UseCaseLocator.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/10/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

protocol UseCaseLocatorProtocol {
    func getUseCase<T>(ofType type: T.Type) -> T?
}

class UseCaseLocator: UseCaseLocatorProtocol {
    
    func getUseCase<T>(ofType type: T.Type) -> T? {
        switch String(describing: type) {
        case String(describing: CalculateSouls.self):
            switch SoulsGameSingleton.getGlobalGame() {
            case .DarkSouls1:
                return buildUseCase(type: CalculateSoulsLordran.self)
            case .DarkSouls2:
                return buildUseCase(type: CalculateSoulsDrangleic.self)
            case .DarkSouls3:
                return buildUseCase(type: CalculateSoulsLothric.self)
            }
        default:
            return nil
        }
    }
}

private extension UseCaseLocator {
    func buildUseCase<U: UseCaseImplementation, R>(type: U.Type) -> R? {
        return U() as? R
    }
}
