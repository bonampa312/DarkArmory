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
    
    static let defaultLocator = UseCaseLocator(service: DarkArmoryAPIService())
    
    fileprivate let service: DarkArmoryService?
    
    init(service: DarkArmoryService?) {
        self.service = service
    }
    
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
        case String(describing: RequestElementsList.self):
            return buildUseCaseWithService(type: RequestElementsListImpl.self)
        default:
            return nil
        }
    }
}

private extension UseCaseLocator {
    func buildUseCase<U: UseCaseImplementation, R>(type: U.Type) -> R? {
        return U() as? R
    }
    
    func buildUseCaseWithService<U: UseCaseWithServiceImplementation, R>(type: U.Type) -> R? {
        guard let localService = self.service else { return U(service: DarkArmoryAPIService()) as? R }
        return U(service: localService) as? R
    }
}
