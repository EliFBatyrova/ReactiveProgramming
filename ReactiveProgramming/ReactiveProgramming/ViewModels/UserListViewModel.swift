//
//  UserListViewModel.swift
//  ReactiveProgramming
//
//  Created by underq  on 06.11.2020.
//

import Foundation
import Combine

class UserListViewModel: ObservableObject {

    init() {
        getUsers()
    }

    let publisher = UsersCombineController(networkController: NetworkController())

    var subscriptions = Set<AnyCancellable>()

    @Published var users: [User] = []
}

extension UserListViewModel {

    func getUsers() {

        publisher.getUsers()
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case let .failure(error):
                    print("Couldn't get users: \(error)")
                case .finished: break
                }
            }) { users in
                
                DispatchQueue.main.async {
                    self.users.append(contentsOf: users)
                }
            }
            .store(in: &subscriptions)
    }
}
