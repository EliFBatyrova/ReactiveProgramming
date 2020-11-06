//
//  User.swift
//  ReactiveProgramming
//
//  Created by underq  on 06.11.2020.
//

import Foundation

struct Users: Codable, CustomStringConvertible {
    let data: [User]?
}

struct User: Codable, Identifiable, CustomStringConvertible {

    let id: Int
    let name: String
    let username: String
    let email: String
    let phone: String
    let website: String

    let address: Address

    let company: Company

    struct Address: Codable, CustomStringConvertible {

        let street: String
        let suite: String
        let city: String
        let zipcode: String

        let geo: Geo

        struct Geo: Codable, CustomStringConvertible {

            let lat: String
            let lng: String
        }
    }

    struct Company: Codable, CustomStringConvertible {

        let name: String
        let catchPhrase: String
        let bs: String
    }
}

extension CustomStringConvertible where Self: Codable {

    // additional information about objects for debugging
    var description: String {
        var description = "\n \(type(of: self)) \n"
        let selfMirror = Mirror(reflecting: self)
        for child in selfMirror.children {
            if let propertyName = child.label {
                description += "\(propertyName): \(child.value)\n"
            }
        }
        return description
    }
}
