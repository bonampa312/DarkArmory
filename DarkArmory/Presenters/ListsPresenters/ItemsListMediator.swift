//
//  ItemsListMediator.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/25/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import Foundation

protocol ItemsListMediator: ItemsListBasePresenter {
    
    //MARK: - List to fill table
    associatedtype T
    var list : [T] { get }

}

extension ItemsListMediator {
    var elementsList: [Any] {
        return list
    }
}
