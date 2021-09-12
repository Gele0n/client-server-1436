//
//  SessionViewController.swift
//  client-server-1436
//
//  Created by Ярослав Троянов on 10.08.2021.
//

import Foundation

class Session {
    
    static let instance = Session()
    
    private init() {}
    
    var userId: Int = 0
    var token: String = ""
    
    let cliendId = "7929759"
    let version = "5.68"
}
