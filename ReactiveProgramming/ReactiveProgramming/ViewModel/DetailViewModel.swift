//
//  DetailViewModel.swift
//  ReactiveProgramming
//
//  Created by Евгений on 12.11.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct DetailViewModel {
    
    let name = BehaviorRelay<String>(value: "")
    let username = BehaviorRelay<String>(value: "")
    let email = BehaviorRelay<String>(value: "")
    let city = BehaviorRelay<String>(value: "")
    let companyName = BehaviorRelay<String>(value: "")
    
    func configure(with user: UserDTO) {
        
        name.accept(user.name)
        username.accept(user.username)
        email.accept(user.email)
        city.accept(user.city)
        companyName.accept(user.companyName)
    }
}
