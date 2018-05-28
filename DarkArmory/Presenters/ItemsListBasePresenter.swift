//
//  ItemsListPresenter.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/18/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

protocol ItemsListView : class {
    func updateList()
    func updateTitles()
    func showConnectionError()
    func showDataErrror()
}

protocol ItemsListBasePresenter {
    
    //MARK: - View that implements presenter
    var view : ItemsListView { get }
    
    //MARK: - Class variables
    var service : DarkArmoryService { get }
    var globalGame : SoulsSeriesGame { get }
    
    //MARK: - View elements variables
    var listTitle : String { get }
    var cellIdentifier : String { get }
    var elementsList: [Any] { get }
    
    init(view : ItemsListView, service: DarkArmoryService)
    
    func configureUI()
    
    func loadList()
    
    func listSize()->Int
    
}
