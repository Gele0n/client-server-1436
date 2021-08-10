//
//  MainViewController.swift
//  client-server-1436
//
//  Created by Ярослав Троянов on 10.08.2021.
//

import UIKit


class MainViewController: UIViewController {
    
    @IBOutlet weak var tokenLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let session = Session.instance
        userIdLabel.text = "User ID: \(session.userId)"
        tokenLabel.text = "Session token: \(session.token)"
    }
}
