//
//  GroupAPI.swift
//  client-server-1436
//
//  Created by Ярослав Троянов on 17.08.2021.
//

import Foundation
import Alamofire

class GroupAPI {
    
    let baseUrl = "https://api.vk.com/method"
    let method = "/groups.get"
    
    var params: Parameters
    
    init(_ session: Session) {
        
        self.params = [
            "client_id": session.cliendId,
            "user_id": session.userId,
            "access_token": session.token,
            "v": session.version,
            "extended": "1",
            "fields": "description,members_count",
        ]
        
    }
    
    func get(_ completion: @escaping (Groups?) -> ()) {
        
        let url = baseUrl + method
        
        AF.request(url, method: .get, parameters: params).responseData { response in
            
            guard let data = response.data else { return }
            
            do {
                var groups: Groups
                groups = try JSONDecoder().decode(Groups.self, from: data)
                completion(groups)
            } catch {
                print(error)
            }
            
        }
    }
}
