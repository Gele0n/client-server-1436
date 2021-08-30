//
//  GroupTableViewController.swift
//  client-server-1436
//
//  Created by Ярослав Троянов on 23.08.2021.
//

import UIKit

class GroupTableViewController: UITableViewController {
    
    var groupItems: [GroupItem] = []
    let groupDB = GroupDB()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let localGroups = groupDB.get()
        
        if localGroups.count > 0 {
            groupItems = localGroups
        }
        
        GroupAPI(Session.instance).get{ [weak self] groups in
            guard let self = self else { return }
            if groups!.response.items != localGroups {
                self.groupItems = groups!.response.items
                self.groupDB.addUpdate(groups!.response.items)
            }
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if groupItems[indexPath.row].groupDescription == "" {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCellNoDesc") as? GroupTableViewCellNoDesc
            else { return UITableViewCell() }
            
            cell.configure(groupItems[indexPath.row])
            return cell
            
        } else {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell") as? GroupTableViewCell
            else { return UITableViewCell() }
            
            cell.configure(groupItems[indexPath.row])
            return cell
            
        }
    }
}
