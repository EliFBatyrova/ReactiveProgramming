//
//  UsersCombineController.swift
//  ReactiveProgramming
//
//  Created by underq  on 06.11.2020.
//

import Foundation
import Combine

protocol UsersCombineControllerProtocol: class {
    var networkController: NetworkControllerProtocol { get }

    func getUsers() -> AnyPublisher<[User], Error>
}

final class UsersCombineController: UsersCombineControllerProtocol {
    
    let networkController: NetworkControllerProtocol
    
    init(networkController: NetworkControllerProtocol) {
        self.networkController = networkController
    }
    
    func getUsers() -> AnyPublisher<[User], Error> {
        let endpoint = APIEndpoint.users
        
        return networkController.get(type: [User].self,
                                     url: endpoint.url,
                                     headers: endpoint.headers)
    }
}
