//
//  MainTableViewCell.swift
//  ReactiveProgramming
//
//  Created by Сергей Шабельник on 29.10.2020.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    func setupCell(user: UserViewModel){
        nameLabel.text = user.nameText
        userNameLabel.text = user.userNameText
        emailLabel.text = user.emailText
        cityLabel.text = user.cityText
        companyLabel.text = user.companyText
    }

}
