//
//  CustomTableViewCell.swift
//  ReactiveProgramming
//
//  Created by Евгений on 29.10.2020.
//  Copyright © 2020 Евгений Кузьмин. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var companyNameLabel: UILabel!
    
    public func configure(with user: UserDTO) {
        self.nameLabel.text = user.name
        self.usernameLabel.text = user.username
        self.emailLabel.text = user.email
        self.cityLabel.text = user.city
        self.companyNameLabel.text = user.companyName
    }
}
