//
//  ElementDetailMediator.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 10/22/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

protocol ItemDetailMediator: ItemDetailBasePresenter {
    
    //MARK: - Element to use
    associatedtype T
    var element : T? { get }
}

extension ItemDetailMediator {
    var elementDetail: Any {
        return element as Any
    }
}
