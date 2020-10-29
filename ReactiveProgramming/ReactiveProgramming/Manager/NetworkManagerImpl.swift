//
//  NetworkManager.swift
//  ReactiveProgramming
//
//  Created by Евгений on 29.10.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

protocol NetworkManager {
    func getUsers(completion: @escaping ([User]) -> Void)
}

class NetworkManagerImpl: NetworkManager {
    
    let url = "https://jsonplaceholder.typicode.com/users"
    
    func getUsers(completion: @escaping ([User]) -> Void) {
        
        if let url = URL(string: url) {
            
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: {
                (data, response, error) in
                
                guard let checkedData = data else { return }
                if let users = try? JSONDecoder().decode([User].self, from: checkedData) {
                    
                    DispatchQueue.main.async {
                        completion(users)
                    }
                }
                else {
                    print("Error: Cannot decode JSON response")
                }
            })
            task.resume()
        }
    }
}
