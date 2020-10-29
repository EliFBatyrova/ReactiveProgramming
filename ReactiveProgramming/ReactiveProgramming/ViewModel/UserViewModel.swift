//
//  UserViewModel.swift
//  ReactiveProgramming
//
//  Created by Евгений on 29.10.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct UserViewModel {
    
    public let users = BehaviorRelay<[UserDTO]>(value: [])
    private let netoworkManager: NetworkManager = NetworkManagerImpl()
    
    func initUsers() {
        netoworkManager.getUsers(completion: { loadedUsers in
            self.users.accept(loadedUsers.map({
                UserDTO(user: $0)
            }))
        })
    }
    
    struct UserDTO {
        
        private let user: User
        
        public var name: String {
            return user.name
        }
        
        public var username: String {
            return user.username
        }
        
        public var email: String {
            return user.email
        }
        
        public var city: String {
            return user.address.city
        }
        
        public var companyName: String {
            return user.company.name
        }
        
        init(user: User) {
            self.user = user
        }
    }
    
}
