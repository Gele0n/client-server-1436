//
//  Photo.swift
//  client-server-1436
//
//  Created by Ярослав Троянов on 14.08.2021.
//

import Foundation

struct PhotoItem {
    let id, albumID, ownerID: Int
    let width, height: Int
    let photo75, photo130, photo604, photo807, photo1280: String?
    let text: String?
}
