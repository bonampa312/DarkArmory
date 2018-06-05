//
//  UseCaseWithServiceImplementation.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 6/5/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

class UseCaseWithServiceImplementation {
    
    let service : DarkArmoryService
    
    required init(service: DarkArmoryService) {
        self.service = service
    }
    
}
