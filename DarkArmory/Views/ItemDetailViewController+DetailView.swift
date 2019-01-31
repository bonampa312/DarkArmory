//
//  ItemDetailViewController+DetailView.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 10/28/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

extension ItemDetailViewController {
    
    func loadDetailViewContent() {
        guard let type = self.elementsType else {
            return
        }
        switch type {
        case .Armors:
            let viewInNeededType = ArmorDetailView()
            viewInNeededType.element = self.presenter?.elementDetail as? ArmorDetail
            viewInNeededType.configureUI()
            self.itemDetailContentView = viewInNeededType
        case .Weapons:
            let viewInNeededType = WeaponDetailView()
            viewInNeededType.element = self.presenter?.elementDetail as? WeaponDetail
            viewInNeededType.configureUI()
            self.itemDetailContentView = viewInNeededType
        case .Spells:
            let viewInNeededType = SpellDetailView()
            viewInNeededType.element = self.presenter?.elementDetail as? SpellDetail
            viewInNeededType.configureUI()
            self.itemDetailContentView = viewInNeededType
        case .Rings:
            let viewInNeededType = RingDetailView()
            viewInNeededType.element = self.presenter?.elementDetail as? RingDetail
            viewInNeededType.configureUI()
            self.itemDetailContentView = viewInNeededType
        case .Misc:
            let viewInNeededType = MiscDetailView()
            viewInNeededType.element = self.presenter?.elementDetail as? MiscDetail
            viewInNeededType.configureUI()
            self.itemDetailContentView = viewInNeededType
        default:
            return
        }
    }
}
