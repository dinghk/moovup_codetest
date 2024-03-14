//
//  HomeViewController+TableViewDelegate.swift
//  Moovup
//
//  Created by Ding Lo on 13/3/2024.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard displayList.count > 0 else { return UITableViewCell() }
        let user = displayList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: PersonItemCell.description(), for: indexPath) as! PersonItemCell
        cell.setup(user: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
