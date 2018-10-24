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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let elementBasicData : ElementBasicData?
        switch self.elementsType! {
        case .Weapons:
            let weaponData = self.presenter?.elementsList[indexPath.row] as! WeaponShort
            elementBasicData = ElementBasicData(name: weaponData.name, id: weaponData.id)
//        case .Rings:
//        case .Misc:
//        case .Spells:
//        case .Armors:
        default:
            elementBasicData = ElementBasicData(name: "Claymore", id: "5aef98705c050400144181e8")
        }
        performSegue(withIdentifier: "itemDetailSegue", sender: elementBasicData)
    }
}
