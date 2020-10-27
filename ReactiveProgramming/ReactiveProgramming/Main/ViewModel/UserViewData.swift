//
//  UserViewData.swift
//  ReactiveProgramming
//
//  Created by Enoxus on 27.10.2020.
//

struct UserViewData {
    let name: String
    let username: String
    let email: String
    let address: String
    let company: String
    
    static func transform(_ user: User) -> UserViewData {
        return UserViewData(name: user.name,
                            username: "@\(user.username)",
                            email: user.email,
                            address: user.address.city,
                            company: user.company.name)
    }
    
    static func transform(_ users: [User]) -> [UserViewData] {
        return users.map({ UserViewData.transform($0) })
    }
}
