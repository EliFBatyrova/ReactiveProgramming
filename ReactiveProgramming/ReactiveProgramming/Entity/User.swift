//
//  User.swift
//  ReactiveProgramming
//
//  Created by Enoxus on 27.10.2020.
//

import Foundation

struct User: Codable {
    let name: String
    let username: String
    let email: String
    let address: Address
    let company: Company
}

struct Address: Codable {
    let city: String
}

struct Company: Codable {
    let name: String
}
