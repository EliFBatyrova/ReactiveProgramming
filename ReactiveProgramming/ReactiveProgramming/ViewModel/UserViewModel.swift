//
//  UserViewModel.swift
//  ReactiveProgramming
//
//  Created by Сергей Шабельник on 15.11.2020.
//

import Foundation

struct UserViewModel {
    
    private let user: User
    
    var nameText: String {
        return "Name: " + user.name
    }
    
    var userNameText: String {
        return "Username: " + user.username
    }
    
    var emailText: String {
        return "Email: " + user.email
    }
    
    var cityText: String {
        return "City: " + user.address.city
    }
    
    var companyText: String {
        return "Company: " + user.company.name
    }
    
    init(user: User){
        self.user = user
    }
}
