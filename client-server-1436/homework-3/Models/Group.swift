//
//  Group.swift
//  client-server-1436
//
//  Created by Ярослав Троянов on 14.08.2021.
//

import Foundation

struct Groups: Codable {
    let response: Response
}
struct Response: Codable {
    let count: Int
    let items: [GroupItem]
}
struct GroupItem: Codable {
    let id: Int
    let name: String
    let groupDescription: String?
    let imageURL: String
    let membersCount: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case groupDescription = "description"
        case imageURL = "photo_100"
        case membersCount = "members_count"
    }
}
