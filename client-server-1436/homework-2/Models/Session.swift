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
