//
//  UsersView.swift
//  ReactiveProgramming
//
//  Created by Amir on 27.10.2020.
//

import SnapKit

class UsersView: UIView {
    
    //MARK: - Main table view
    let tableView = UITableView()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - UI configuration
    private func initTableView() {
        
        self.backgroundColor = .white
        
        tableView.register(cell: UserCell.self)
        tableView.tableFooterView = UIView()
        
        addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
