//
//  User.swift
//  ReactiveProgramming
//
//  Created by Сергей Шабельник on 14.11.2020.
//

import Foundation

struct User: Decodable {
    let name: String
    let username: String
    let email: String
    let address: Address
    let company: Company
}

struct Address: Decodable {
    let city: String
}

struct Company: Decodable {
    let name: String
}
