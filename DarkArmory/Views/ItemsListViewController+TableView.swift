//
//  ItemsListViewController+TableView.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/28/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

extension ItemsListViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.presenter?.listSize())!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellIdentifier = self.presenter?.cellIdentifier else {
            return UITableViewCell()
        }
        switch self.elementsType! {
        case .Weapons:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! WeaponsTableViewCell
            cell.configure(weapon: self.presenter?.elementsList[indexPath.row] as! WeaponShort)
            // TODO - Remove for Detail
//            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        case .Rings:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RingsTableViewCell
            cell.configure(ring: self.presenter?.elementsList[indexPath.row] as! RingShort)
            // TODO - Remove for Detail
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        case .Misc:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! MiscsTableViewCell
            cell.configure(misc: self.presenter?.elementsList[indexPath.row] as! MiscShort)
            // TODO - Remove for Detail
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        case .Spells:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SpellsTableViewCell
            cell.configure(spell: self.presenter?.elementsList[indexPath.row] as! SpellsShort)
            // TODO - Remove for Detail
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        case .Armors:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ArmorsTableViewCell
            cell.configure(armor: self.presenter?.elementsList[indexPath.row] as! ArmorsShort)
            // TODO - Remove for Detail
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}
