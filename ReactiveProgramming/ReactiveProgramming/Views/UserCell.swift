//
//  UserCell.swift
//  ReactiveProgramming
//
//  Created by Amir on 27.10.2020.
//

import UIKit

class UserCell: UITableViewCell {
    
    //MARK: - UI Components
    private let namelabel = UILabel(font: UIFont.boldSystemFont(ofSize: 18), textColor: .black)
    private let usernamelabel = UILabel(textColor: .black)
    private let emaillabel = UILabel(textColor: .black)
    private let addresslabel = UILabel(textColor: .black)
    private let companylabel = UILabel(textColor: .black)
    private lazy var mainStack = UIStackView(arrangedSubviews: [namelabel, usernamelabel, emaillabel, addresslabel, companylabel],
                                             spacing: 5,
                                             distribution: .equalSpacing,
                                             axis: .vertical)
    
    //MARK: - Initializer
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Cell configuration
    func configure(with user: UserDTO) {
        
        namelabel.text = "Name: \(user.name)"
        usernamelabel.text = "Username: \(user.username)"
        emaillabel.text = "Email: \(user.email)"
        addresslabel.text = "City: \(user.address)"
        companylabel.text = "Company: \(user.companyName)"
    }
    
    private func initViews() {
        
        contentView.addSubview(mainStack)
        
        mainStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
}
