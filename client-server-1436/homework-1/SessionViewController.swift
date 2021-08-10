//
//  SessionViewController.swift
//  client-server-1436
//
//  Created by Ярослав Троянов on 10.08.2021.
//

import UIKit

class Session {
    static let instance = Session()
    private init() {}
    var userId: Int = 0
    var token: String = ""
}

class SessionViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let session = Session.instance
        session.userId = 1984
        session.token = "example"
    }
}
