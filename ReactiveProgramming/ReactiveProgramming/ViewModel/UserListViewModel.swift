//
//  UserListViewModel.swift
//  ReactiveProgramming
//
//  Created by Сергей Шабельник on 15.11.2020.
//

import Foundation
import RxSwift

final class UserListViewModel {
    
    let title = "Users"
    
    private let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol = UserService()) {
        self.userService = userService
    }
    
    func fetchUsers() -> Observable<[UserViewModel]> {
        userService.fetchUsers().map { $0.map {
            UserViewModel(user: $0)
        } }
    }
}
