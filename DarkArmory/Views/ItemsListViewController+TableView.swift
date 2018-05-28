//
//  ItemsListViewController+TableView.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/28/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

extension ItemsListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
}

extension ItemsListViewController : UITableViewDataSource {
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
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}
