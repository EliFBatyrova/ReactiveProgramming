//
//  User.swift
//  ReactiveProgramming
//
//  Created by Евгений on 29.10.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation

struct User: Codable {
    
    var name: String
    var username: String
    var email: String
    var address: Address
    var company: Company
    
    public init(name: String, username: String, email: String, address: User.Address, company: User.Company) {
        self.name = name
        self.username = username
        self.email = email
        self.address = address
        self.company = company
    }
    
    struct Address: Codable {
        
        var city: String
        
        public init(city: String) {
            self.city = city
        }
    }
    
    struct Company: Codable {
        var name: String
        
        public init(name: String) {
            self.name = name
        }
    }
}
