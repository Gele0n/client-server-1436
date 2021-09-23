//
//  Group.swift
//  client-server-1436
//
//  Created by Ярослав Троянов on 14.08.2021.
//

import Foundation
import RealmSwift

struct Groups: Codable {

}

struct Response: Codable {
    let count: Int
    let items: [GroupItem]
}

class GroupItem: Codable {
    var id: Int = 0
    var name: String = ""
    var groupDescription: String?
    var imageURL: String = ""
    var membersCount: Int = 0

    enum CodingKeys: String, CodingKey {
        case id, name
        case groupDescription = "description"
        case imageURL = "photo_100"
        case membersCount = "members_count"
    }
}
