//
//  PhotoDB.swift
//  client-server-1436
//
//  Created by Ярослав Троянов on 30.08.2021.
//

import Foundation
import RealmSwift

protocol PhotoDBProtocol {
    
    func get() -> [PhotoItem]
    func addUpdate(_ photos: [PhotoItem])
}

class PhotoDB: PhotoDBProtocol {
    
    let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    lazy var mainRealm = try! Realm(configuration: config)
    
    func get() -> [PhotoItem] {
        
        let photos = mainRealm.objects(PhotoItem.self)
        return Array(photos)
    }
    
    func addUpdate(_ photos: [PhotoItem]) {
        
        do {
            mainRealm.beginWrite()
            photos.forEach{ mainRealm.add($0, update: .all) }
            try mainRealm.commitWrite()
            
        } catch {
            print(error)
        }
    }
}
