//
//  UserService.swift
//  ReactiveProgramming
//
//  Created by Сергей Шабельник on 14.11.2020.
//

import Foundation
import RxSwift

protocol UserServiceProtocol {
    func fetchUsers() -> Observable<[User]>
}

class UserService: UserServiceProtocol {
    
    func fetchUsers() -> Observable<[User]> {
        
        return Observable.create { (observer) -> Disposable in
            
            let task = URLSession.shared.dataTask(with: URL(string: Endpoint.URL)!) { (data, _, error) in
                
                guard let data = data else {
                    observer.onError(NSError(domain: "error", code: -1, userInfo: nil))
                    return
                }
                
                do{
                    let users = try JSONDecoder().decode([User].self, from: data)
                    observer.onNext(users)
                } catch {
                    observer.onError(error)
                }    
            }
            
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}
