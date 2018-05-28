//
//  ItemsListViewController+TableView.swift
//  DarkArmory
//
//  Created by Santiago Romero Restrepo on 5/28/18.
//  Copyright © 2018 Santiago Romero Restrepo. All rights reserved.
//

import UIKit

extension ItemsListViewController : UITableViewDelegate {
    
}

extension ItemsListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.presenter?.listSize())!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellIdentifier = self.presenter?.cellIdentifier else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
        return cell!
    }
    
    
}
