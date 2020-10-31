//
//  UsersProvider.swift
//  ReactiveProgramming
//
//  Created by Amir on 27.10.2020.
//

import Moya

protocol UsersProviderProtocol {
    func getUsersList(completion: @escaping ([UserDTO]?) -> Void)
}

struct UsersProvider: UsersProviderProtocol {
    
    private let moyaProvider = MoyaProvider<UsersListApiConfiguration>()
    
    func getUsersList(completion: @escaping ([UserDTO]?) -> Void) {
        
        moyaProvider.request(.users) { result in
            
            switch result {
            
            case .success(let response):
                do {
                    let users = try JSONDecoder().decode([UserNetwork].self, from: response.data).map { $0.toDTO() }
                    completion(users)
                } catch {
                    print("An error occured: \(error.localizedDescription)")
                    completion(nil)
                }
            case .failure(let error):
                print("An error occured: \(error.localizedDescription)")
                completion(nil)
            }                                    
        }
    }
}
