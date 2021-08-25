//
//  MainViewController.swift
//  client-server-1436
//
//  Created by Ярослав Троянов on 17.08.2021.
//

import UIKit

class MainViewController: UIViewController {
    
 //   let vkService = VKService(session: Session.instance)
    
    let errorMessage = "Ошибка!"
    
    let searchQuery = "Swift"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vkService.getFriendsList() { json in
            print("Получение списка друзей")
            print(self.stringify(json) ?? self.errorMessage)
        }
        
        vkService.getPhotos() { json in
            print("Получение фото человека")
            print(self.stringify(json) ?? self.errorMessage)
        }
        
        vkService.getGroups() { json in
            print("Получение групп")
            print(self.stringify(json) ?? self.errorMessage)
        }
        
        vkService.searchGroups(searchQuery: searchQuery, count: 10) { json in
            print("Получение групп по поисковому запросу \(self.searchQuery)")
            print(self.stringify(json) ?? self.errorMessage)
        }
    }
    
    func stringify(_ json: Any?) -> String? {
        guard let json = json else {
            return nil
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
            if let string = String(data: data, encoding: String.Encoding.utf8) {
                return string
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}
