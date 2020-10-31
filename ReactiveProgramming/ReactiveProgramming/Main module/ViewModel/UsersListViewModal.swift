//
//  UsersListViewModal.swift
//  ReactiveProgramming
//
//  Created by Amir on 27.10.2020.
//

import RxRelay
import Moya

struct UsersListViewModel {
    
    let usersList = BehaviorRelay<[UserDTO]>(value: [])
    
    private let usersProvider: UsersProviderProtocol = UsersProvider()
    
    func getUsers() {
        
        usersProvider.getUsersList { usersResponse in
            
            guard let usersResponse = usersResponse else { return }
            
            usersList.accept(usersResponse)
        }
    }
}
