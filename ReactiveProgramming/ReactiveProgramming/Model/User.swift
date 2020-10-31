//
//  User.swift
//  ReactiveProgramming
//
//  Created by Amir on 27.10.2020.
//

import Foundation

struct UserNetwork: Codable {
    
    let name: String
    let username: String
    let email: String
    let address: Address
    let company: Company
    
    func toDTO() -> UserDTO {
        UserDTO(name: name, username: username, email: email, address: address.city, companyName: company.name)
    }
}

struct Company: Codable {
    let name: String
}

struct Address: Codable {
    let city: String
}
