//
//  Group.swift
//  client-server-1436
//
//  Created by Ярослав Троянов on 14.08.2021.
//

import Foundation
import RealmSwift

struct Groups: Codable {
    let response: Response
}

struct Response: Codable {
    let count: Int
    let items: [GroupItem]
}

class GroupItem: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var groupDescription: String?
    @objc dynamic var imageURL: String = ""
    @objc dynamic var membersCount: Int = 0

    enum CodingKeys: String, CodingKey {
        case id, name
        case groupDescription = "description"
        case imageURL = "photo_100"
        case membersCount = "members_count"
    }

    override static func primaryKey() -> String? {
        return "id"
    }
}
